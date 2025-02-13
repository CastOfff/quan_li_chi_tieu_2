enum CategoryType {
  eating('Ăn uống'),
  clothes('Quần áo'),
  spending('Chi tiêu'),
  cosmetics('Mỹ phẩm'),
  transactionFee('Phí giao dịch'),
  healthcare('Y tế'),
  education('Giáo dục'),
  utilities('Điện nước'),
  transport('Đi lại'),
  internet('Mạng'),
  rent('Tiền nhà'),
  entertainment('Giải trí'),
  salary('Tiền lương'),
  allowance('Tiền phụ cấp'),
  bonus('Tiền thưởng '),
  investment('Đầu tư'),
  sideIncome('Thu nhập phụ'),
  temporaryIncome('Thu nhập tạm thời');
  final String description;
  const CategoryType(this.description);
}