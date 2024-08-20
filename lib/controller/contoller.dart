import '../model/cal_model.dart';

class CalculatorController{
  final CalculatorModel _model;

  CalculatorController(this._model);

  void handleInput(String input) {
    switch (input) {
      case 'C':
        _model.clear();
        break;
      case '+':
      case '-':
      case '*':
      case '/':
        _model.setOperation(input);
        _model.setFirstOperand(_model.result);
        _model.setSecondOperand(0.0);
        break;
      case '=':
        _model.calculate();
        break;
      default:
        if (_model.operation.isEmpty) {
          _model.setFirstOperand(double.parse('${_model.firstOperand}$input'));
        } else {
          _model.setSecondOperand(double.parse('${_model.secondOperand}$input'));
        }
    }
  }

}