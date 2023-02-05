import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = false;
  final _isMilliSeconds = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _stopWatchTimer.rawTime,
      initialData: _stopWatchTimer.rawTime.value,
      builder: (context, snapshot) {
        final value = snapshot.data;
        final displayTime = StopWatchTimer.getDisplayTime(value!,
            hours: _isHours, milliSecond: _isMilliSeconds);
        _stopWatchTimer.onStartTimer();
        return Column(
          children: [
            Text(
              displayTime,
              style: TextStyle(fontSize: 20, fontFamily: 'Rajdhani'),
            ),
            // TextButton(
            //     onPressed: () {
            //       _stopWatchTimer.onStopTimer();
            //     },
            //     child: Text('Stop'))
          ],
        );
      },
    );
  }
}
