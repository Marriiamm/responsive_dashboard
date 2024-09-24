import 'package:flutter/material.dart';
import 'package:responsive_dash_board/utils/app_styles.dart';

import 'custom_buttom.dart';
import 'customcontainer_background.dart';
import 'latest_transaction.dart';
import 'titleTextField.dart';

class QuickInvoice extends StatelessWidget {
  const QuickInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuickInvoiceHeader(),
          LatestTransaction(),
          Divider(
            height: 30,
            color: Color(0xffF1F1F1),
          ),
          QuickInvoiceForm(),
        ],
      ),
    );
  }
}

class QuickInvoiceForm extends StatelessWidget {
  const QuickInvoiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
                child: TitleTextField(
              title: 'Customer Name',
              hint: 'Type Customer Name',
            )),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: TitleTextField(
              title: 'Customer Email',
              hint: 'Type Customer Email',
            )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Row(
          children: [
            Expanded(
                child: TitleTextField(
              title: 'Item Name',
              hint: 'Type Customer Name',
            )),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: TitleTextField(
              title: 'Item Amount',
              hint: 'USD',
            )),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
                child: CustomButton(
              title: Text(
                "Add more details",
                style: AppStyles.styleSemiBold18(context)
                    .copyWith(color: const Color(0xff4EB7F2)),
              ),
              backColor: Colors.white,
            )),
            const SizedBox(
              width: 8,
            ),
             Expanded(
                child: CustomButton(
              title: Text(
                "Send Money",
                style: AppStyles.styleSemiBold18(context),
              ),
              backColor: const Color(0xff4EB7F2),
            )),
          ],
        ),
      ],
    );
  }
}

class QuickInvoiceHeader extends StatelessWidget {
  const QuickInvoiceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          "Quick Invoice",
          style: AppStyles.styleSemiBold20(context),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: const ShapeDecoration(
              shape: OvalBorder(), color: Color(0xffFAFAFA)),
          child: const Icon(
            Icons.add,
            color: Color(0xff4EB7F2),
          ),
        ),
      ],
    );
  }
}
