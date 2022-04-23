class ProspectsListData {
  ProspectsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.prospects,
    this.weeks = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? prospects;
  int weeks;

  static List<ProspectsListData> tabIconsList = <ProspectsListData>[
    ProspectsListData(
      imagePath: '',
      titleTxt: 'Jane',
      weeks: 15,
      prospects: <String>['Ngala'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    ProspectsListData(
      imagePath: '',
      titleTxt: 'John',
      weeks: 62,
      prospects: <String>['Shella'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    ProspectsListData(
      imagePath: '',
      titleTxt: 'Son',
      weeks: 15,
      prospects: <String>['Magongo'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    ProspectsListData(
      imagePath: '',
      titleTxt: 'Don',
      weeks: 49,
      prospects: <String>['Ganda'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
