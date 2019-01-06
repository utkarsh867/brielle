class Letters {
  Letters(this._letter);

  List<bool> _vibrationButtonPattern;
  String _letter;

  List<bool> get vibrationButtonPattern {
    getLetterLogic();
    return _vibrationButtonPattern;
  }

  void getLetterLogic() {
    _letter = _letter.toUpperCase();

    switch (_letter) {
      case "A":
        {
          _vibrationButtonPattern = [true, false, false, false, false, false];
          break;
        }
      case "B":
        {
          _vibrationButtonPattern = [true, false, true, false, false, false];
          break;
        }
      case "C":
        {
          _vibrationButtonPattern = [true, true, false, false, false, false];
          break;
        }
      case "D":
        {
          _vibrationButtonPattern = [true, true, false, true, false, false];
          break;
        }
      case "E":
        {
          _vibrationButtonPattern = [true, false, false, true, false, false];
          break;
        }
      case "F":
        {
          _vibrationButtonPattern = [true, true, true, false, false, false];
          break;
        }
      case "G":
        {
          _vibrationButtonPattern = [true, true, true, true, false, false];
          break;
        }
      case "H":
        {
          _vibrationButtonPattern = [true, false, true, true, false, false];
          break;
        }
      case "I":
        {
          _vibrationButtonPattern = [false, true, true, false, false, false];
          break;
        }
      case "J":
        {
          _vibrationButtonPattern = [false, true, true, true, false, false];
          break;
        }
      case "K":
        {
          _vibrationButtonPattern = [true, false, false, false, true, false];
          break;
        }
      case "L":
        {
          _vibrationButtonPattern = [true, false, true, false, true, false];
          break;
        }
      case "M":
        {
          _vibrationButtonPattern = [true, true, false, false, true, false];
          break;
        }
      case "N":
        {
          _vibrationButtonPattern = [true, true, false, true, true, false];
          break;
        }
      case "O":
        {
          _vibrationButtonPattern = [true, false, false, true, true, false];
          break;
        }
      case "P":
        {
          _vibrationButtonPattern = [true, true, true, false, true, false];
          break;
        }
      case "Q":
        {
          _vibrationButtonPattern = [true, true, true, true, true, false];
          break;
        }
      case "R":
        {
          _vibrationButtonPattern = [true, false, true, true, true, false];
          break;
        }
      case "S":
        {
          _vibrationButtonPattern = [false, true, true, false, true, false];
          break;
        }
      case "T":
        {
          _vibrationButtonPattern = [false, true, true, true, true, false];
          break;
        }
      case "U":
        {
          _vibrationButtonPattern = [true, false, false, false, true, true];
          break;
        }
      case "V":
        {
          _vibrationButtonPattern = [true, false, true, false, true, true];
          break;
        }
      case "W":
        {
          _vibrationButtonPattern = [false, true, true, true, false, true];
          break;
        }
      case "X":
        {
          _vibrationButtonPattern = [true, true, false, false, true, true];
          break;
        }
      case "Y":
        {
          _vibrationButtonPattern = [true, true, false, true, true, true];
          break;
        }
      case "Z":
        {
          _vibrationButtonPattern = [true, false, false, true, true, true];
          break;
        }
    }
  }
}
