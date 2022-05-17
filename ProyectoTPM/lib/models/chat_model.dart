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
      message: "Watssup!",
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
      message: "Me encanta Michoacan",
      time: "12:30",
      imageUrl: "https://th.bing.com/th/id/OIP.mP4GRW7Wkdw699kqm8KDwQHaE7?pid=ImgDet&rs=1"
  ),

  new ChatModel(
      name: "Karlos",
      message: "Si, te veo ahi",
      time: "11:16",
      imageUrl: "https://media.istockphoto.com/photos/portrait-of-a-handsome-latin-man-picture-id1160811064?k=6&m=1160811064&s=170667a&w=0&h=JVovmZJw66OeNRQjtMh6hpdof8xJxgzcwccPH9oc60U="
  )
];
