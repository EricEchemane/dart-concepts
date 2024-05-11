extension StringExtension on String {
  String get capitalize => this[0].toUpperCase() + this.substring(1).toLowerCase();

  String get titleCase => this.split(' ').map((word) {
      return word.capitalize;
    }).join(' ');
}

void main() {
  print('eric echEmane'.titleCase);
}