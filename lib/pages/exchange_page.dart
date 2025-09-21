import 'package:action_labs/bloc/exchange_cubit.dart';
import 'package:action_labs/comopents/button_widget.dart';
import 'package:action_labs/comopents/copyright_bottom.dart';
import 'package:action_labs/comopents/exchange_result_card.dart';
import 'package:action_labs/comopents/header_widget.dart';
import 'package:action_labs/comopents/text_form_field_widget.dart';
import 'package:action_labs/utils/colors.dart';
import 'package:action_labs/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("BRL Exchange Rate", style: TextStyles.headline1()),
                    SizedBox(height: 32),
                    TextFormFieldWidget(
                      controller: _controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma moeda';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32),
                    ButtonWidget(
                      label: "EXCHANGE RESULT",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ExchangeCubit>().fetchExchange(
                            _controller.text.toUpperCase(),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 32),
                    Divider(color: AppColors.grey01),
                    const SizedBox(height: 30),
                    BlocBuilder<ExchangeCubit, ExchangeState>(
                      builder: (context, state) {
                        if (state is ExchangeLoading) {
                          return const CircularProgressIndicator(
                            color: AppColors.branded,
                          );
                        } else if (state is ExchangeLoaded) {
                          final d = state.data;
                          return ExchangeResultCard(
                            pair: "${d.to}/${d.from}",
                            updatedAt:
                                "${d.updatedAt.day}/${d.updatedAt.month}/${d.updatedAt.year} - "
                                "${d.updatedAt.hour}h${d.updatedAt.minute.toString().padLeft(2, '0')}",
                            rate: d.rate,
                            history: d.history,
                          );
                        } else if (state is ExchangeError) {
                          return Text(
                            state.message,
                            style: const TextStyle(color: AppColors.alertRed),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          CopyrightBottom(),
        ],
      ),
    );
  }
}
