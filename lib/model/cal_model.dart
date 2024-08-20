class CalculatorModel {
  double _result = 0.0;
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operation = '';

  double get result => _result;
  double get firstOperand => _num1;
  double get secondOperand => _num2;
  String get operation => _operation;

  void clear() {
    _result = 0.0;
    _num1 = 0.0;
    _num2 = 0.0;
    _operation = '';
  }

  void setFirstOperand(double value) {
    _num1 = value;
  }

  void setSecondOperand(double value) {
    _num2 = value;
  }

  void setOperation(String op) {
    _operation = op;
  }

  void calculate() {
    switch (_operation) {
      case '+':
        _result = _num1 + _num2;
        break;
      case '-':
        _result = _num1 - _num2;
        break;
      case '*':
        _result = _num1 * _num2;
        break;
      case '/':
        if (_num2 != 0) {
          _result = _num1 / _num2;
        } else {
          // Handle division by zero error
          _result = double.nan;
        }
        break;
      default:
        _result = _num1;
    }
  }
}