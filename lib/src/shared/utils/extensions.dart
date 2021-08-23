extension parse on double {
  String reais() {
    return "R\$ ${this.toStringAsFixed(2).replaceAll(".", ",")}";
  }
}

extension currency on int {
  String reais() {
    if(this.isNegative == true){
      return "-R\$ ${(this.toDouble()/100.00).toStringAsFixed(2).replaceAll(".", ",").replaceAll("-", "")}";
    }
    return "R\$ ${(this.toDouble()/100.00).toStringAsFixed(2).replaceAll(".", ",")}";
  }
}