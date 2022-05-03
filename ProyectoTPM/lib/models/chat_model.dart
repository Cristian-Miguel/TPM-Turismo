class ChatModel
{
  final String name;
  String message;
  final String time;
  final String imageUrl;

  ChatModel({required this.name,required this.message, required this.time,required this.imageUrl});
}

List <ChatModel> messageData = [
  new ChatModel(
      name: "Juan Jesus",
      message: "Hola te paso informacion sobre...",
      time: "15:30",
      imageUrl: "https://http2.mlstatic.com/traje-formal-hombre-vestido-boss-armani-D_NQ_NP_621121-MCO20717555370_052016-F.jpg"
  ),

  new ChatModel(
      name: "Maria Elena",
      message: "Hola te paso informacion sobre...",
      time: "16:30",
      imageUrl: "https://th.bing.com/th/id/OIP.DqQp2MTPz9G8kcWeHoAj8gHaIv?pid=ImgDet&rs=1"
  ),

  new ChatModel(
      name: "Cristian Miguel",
      message: "No no tenemos lugar ya...",
      time: "14:30",
      imageUrl: "https://th.bing.com/th/id/R.608750cd92eabd5ab29c92ef611aafb8?rik=dp%2bT3WCYakY9BA&pid=ImgRaw&r=0"
  ),

  new ChatModel(
      name: "Paola",
      message: "Hola que tal neni, si...",
      time: "12:30",
      imageUrl: "https://difundir.org/wp-content/uploads/2019/04/3-50.jpg"
  ),

  new ChatModel(
      name: "Karlos",
      message: "Si, te veo ahi",
      time: "11:16",
      imageUrl: "https://get.pxhere.com/photo/man-person-people-hair-male-hairstyle-beard-face-nose-eyes-one-head-moustache-forehead-chin-facial-hair-818812.jpg"
  )
];
