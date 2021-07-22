import 'package:flutter/material.dart';
import 'package:wired_elements/src/const.dart';
import 'canvas/wired_canvas.dart';
import 'wired_base.dart';

/// Wired calendar.
///
/// Usage:
/// ```dart
/// Container(
/// 	color: Colors.grey.shade200,
/// 	padding: EdgeInsets.all(15.0),
/// 	height: 460.0,
/// 	child: WiredCalendar(
/// 	selected: '20210722',
/// 	onSelected: (value) {
/// 		print('Selected date: $value');
/// 		},
/// 	),
/// )
/// ```
class WiredCalendar extends StatefulWidget {
  /// The date to be selected.
  /// Format: "YYYYMMDD"
  final String? selected;

  /// Called when the selected date changed.
  final void Function(String selected)? onSelected;

  const WiredCalendar({Key? key, this.selected, this.onSelected})
      : super(key: key);

  @override
  _WiredCalendarState createState() => _WiredCalendarState();
}

class _WiredCalendarState extends State<WiredCalendar> {
  final _weekdaysShort = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  DateTime _firstOfMonthDate = DateTime.now();
  List<CalendarCell> _weeks = [];
  String _monthYear = '';

  String? _selected;

  @override
  void initState() {
    super.initState();

    _initParams();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _buildWeekdaysNav(),
          SizedBox(height: 20.0),
          _buildWeeksHeaderUI(),
          Expanded(
            child: _buildWeekdaysUI(),
          ),
        ],
      ),
    );
  }

  _refresh() {
    _setInitialConditions();
    _computeCalendar();
  }

  _buildWeekdaysNav() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              _onPre();
            },
            child: _wiredText(
              '<<',
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          _wiredText(
            '$_monthYear',
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
          InkWell(
            onTap: () {
              _onNext();
            },
            child: _wiredText(
              '>>',
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }

  _onPre() {
    _firstOfMonthDate =
        DateTime(_firstOfMonthDate.year, _firstOfMonthDate.month - 1, 1);
    _computeCalendar();
    setState(() {});
  }

  _onNext() {
    _firstOfMonthDate =
        DateTime(_firstOfMonthDate.year, _firstOfMonthDate.month + 1, 1);
    _computeCalendar();
    setState(() {});
  }

  _buildWeeksHeaderUI() {
    List<Widget> headers = [];
    _weekdaysShort.forEach(
      (weekday) {
        headers.add(
          _buildCell(
            weekday,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        );
      },
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: headers,
    );
  }

  _buildWeekdaysUI() {
    List<Widget> weekdays = [];
    _weeks.forEach(
      (week) {
        weekdays.add(
          InkWell(
            onTap: () {
              if (_selected == week.value) return;
              _selected = week.value;
              _refresh();
              setState(() {});

              if (widget.onSelected != null) {
                widget.onSelected!(week.value);
              }
            },
            child: _buildCell(
              week.text,
              selected: week.selected,
              color: week.color,
            ),
          ),
        );
      },
    );

    return GridView.count(
      crossAxisCount: 7,
      children: [...weekdays],
    );
  }

  _initParams() {
    _selected = widget.selected;
  }

  _setInitialConditions() {
    DateTime d;
    if (_selected != null) {
      try {
        d = DateTime.parse(_selected!);
      } catch (e) {
        d = DateTime.now();
      }
    } else {
      d = DateTime.now();
    }

    _firstOfMonthDate = DateTime(d.year, d.month, 1);
  }

  _computeCalendar() {
    _monthYear =
        _months[_firstOfMonthDate.month - 1] + ' ${_firstOfMonthDate.year}';

    var firstDayInMonth =
        DateTime(_firstOfMonthDate.year, _firstOfMonthDate.month, 1);
    var dayInMonthOffset = 0 - (firstDayInMonth.weekday % 7);
    var amountOfWeeks =
        (DateTime(_firstOfMonthDate.year, _firstOfMonthDate.month + 1, 0).day -
                dayInMonthOffset) /
            7;

    _weeks.clear();
    for (var weekIndex = 0; weekIndex < amountOfWeeks; weekIndex++) {
      for (var dayOfWeekIndex = 0; dayOfWeekIndex < 7; dayOfWeekIndex++) {
        var day = DateTime.fromMillisecondsSinceEpoch(
            firstDayInMonth.millisecondsSinceEpoch + DAY * dayInMonthOffset);
        var formatedDate = _format(day);

        _weeks.add(
          CalendarCell(
            value: formatedDate,
            text: day.day.toString(),
            selected: _selected != null && day == DateTime.parse(_selected!),
            dimmed: day.month != firstDayInMonth.month,
            color: day.month == firstDayInMonth.month
                ? textColor
                : disabledTextColor,
            disabled: false,
          ),
        );

        dayInMonthOffset++;
      }
    }
  }

  _buildCell(
    String text, {
    selected = false,
    width = 45.0,
    height = 50.0,
    fontWeight = FontWeight.w500,
    fontSize = 20.0,
    color = textColor,
  }) {
    return selected
        ? Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                top: 0,
                width: width,
                height: height,
                child: WiredCanvas(
                  painter: WiredCircleBase(diameterRatio: .8),
                  fillerType: RoughFilter.NoFiller,
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: _wiredText(
                    text,
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                    color: color,
                  ),
                ),
              ),
            ],
          )
        : SizedBox(
            width: width,
            height: height,
            child: Center(
              child: _wiredText(
                text,
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: color,
              ),
            ),
          );
  }

  _wiredText(
    String text, {
    FontWeight fontWeight = FontWeight.w500,
    double fontSize = 18.0,
    Color color = textColor,
  }) {
    return Text(
      '$text',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Architects Daughter',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  _format(DateTime d) {
    return '${d.year}${d.month.toString().padLeft(2, '0')}${d.day.toString().padLeft(2, '0')}';
  }
}

// GLOBAL CONSTANTS
const SECOND = 1000;
const MINUTE = SECOND * 60;
const HOUR = MINUTE * 60;
const DAY = HOUR * 24;

class CalendarCell {
  final String value;
  final String text;
  final bool selected;
  final bool dimmed;
  final bool disabled;
  final Color color;

  CalendarCell({
    required this.value,
    required this.text,
    required this.selected,
    required this.dimmed,
    this.color = textColor,
    this.disabled = false,
  });
}
