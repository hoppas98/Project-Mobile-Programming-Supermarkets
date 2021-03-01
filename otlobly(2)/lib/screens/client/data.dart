class AboutInfo{
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String>images;
  
  AboutInfo(
    this.position,{
      this.name,
      this.iconImage,
      this.description,
      this.images,
    });
}

List<AboutInfo> abouts=[
  AboutInfo(1,
  name:'Services',
  iconImage: 'assets/services.png',
  description: 
    "Our services in this Mobile application are we selling all the products that can any client imagine in the same app, clients can make shopping from home easily. We also make offers in products a lot just press allow the notification to reach you everything new.",
  ),
  AboutInfo(2,
  name:'Delivery',
  iconImage: 'assets/delivery.jpg',
  description: 
    "We provide a fastest delivery in our application to make client's order come within 60 minutes",
  ),
  AboutInfo(3,
  name:'Markets',
  iconImage: 'assets/markets.jpg',
  description: 
    "We deal with many supermarkets in our application such as Carefour, Awlad Ragab, Metro, Kheir Zaman, and Sauodi",
  ), 
];