import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  ChartBar({this.label, this.spendingAmount, this.spendingPercentageOfTotal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          children: [
            Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  "\$${spendingAmount.toStringAsFixed(0)}",
                ),
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              height: constraint.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              child: FittedBox(child: Text(label)),
              height: constraint.maxHeight * 0.15,
            ),
          ],
        );
      },
    );
  }
}
