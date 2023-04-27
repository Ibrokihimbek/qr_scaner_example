import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scaner_example/screens/scaner/bloc/bloc/scaner_bloc.dart';
import 'package:qr_scaner_example/screens/scaner/scaner_painter/scaner_painter.dart';
import 'package:qr_scaner_example/screens/scaner/widgets/scnaer_button_widget.dart';
import 'package:qr_scaner_example/screens/succes/succes_page.dart';

class ScanerPage extends StatefulWidget {
  const ScanerPage({super.key});

  @override
  State<ScanerPage> createState() => _ScanerPageState();
}

class _ScanerPageState extends State<ScanerPage> {
  late MobileScannerController controller = MobileScannerController();
  late RRect scanWindow;
  late Rect rect;
  late Rect windowRect;
  late Size size;
  bool backgroundColor = false;
  Barcode? barcode;
  BarcodeCapture? capture;

  Future<void> onDetect(BarcodeCapture barcode) async {
    capture = barcode;
    setState(() => this.barcode = barcode.barcodes.first);
  }

  MobileScannerArguments? arguments;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    rect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: 250,
      height: 250,
    );
    scanWindow = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(12),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanerBloc(),
      child: BlocConsumer<ScanerBloc, ScanerState>(
        listener: (context, state) {
          if (state.status.isSutiable) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SuccessPage(
                  barCode: state.barCode,
                ),
              ),
            );
          } else if (state.status.isUnSuitable) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text('inappropriate link'),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Builder(
              builder: (context) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    MobileScanner(
                      fit: BoxFit.cover,
                      scanWindow: rect,
                      controller: controller,
                      onScannerStarted: (arguments) {
                        setState(() {
                          this.arguments = arguments;
                        });
                      },
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        final Uint8List? image = capture.image;
                        context.read<ScanerBloc>().add(
                              ScanerCheckEvent(
                                barCode: barcodes.first.rawValue ?? '',
                              ),
                            );
                      },
                    ),
                    if (barcode != null &&
                        barcode?.corners != null &&
                        arguments != null)
                      CustomPaint(
                        painter: BarcodeOverlay(
                          barcode: barcode!,
                          arguments: arguments!,
                          boxFit: BoxFit.contain,
                          capture: capture!,
                        ),
                      ),
                    Positioned.fill(
                      top: (size.height / 2) + 136 - 600,
                      child: CustomPaint(
                        painter: ScannerOverlay(scanWindow),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: (size.height / 3.5),
                      child: const Text(
                        "Отсканируйте QR-код на Q.watt",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      right: 16,
                      child: ScannerButtonWidget(
                        backgroundColor: !backgroundColor
                            ? Colors.black.withOpacity(0.7)
                            : Colors.white,
                        onTap: () {
                          controller.toggleTorch();
                          setState(() {
                            backgroundColor = !backgroundColor;
                          });
                        },
                        widget: ValueListenableBuilder(
                          valueListenable: controller.torchState,
                          builder: (context, state, child) {
                            if (state == null) {
                              return const Icon(
                                Icons.flash_off,
                                color: Colors.white,
                              );
                            }
                            switch (state) {
                              case TorchState.off:
                                return const Icon(
                                  Icons.flash_off,
                                  color: Colors.white,
                                );
                              case TorchState.on:
                                return const Icon(
                                  Icons.flash_on,
                                  color: Colors.grey,
                                );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
