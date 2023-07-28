class messeg{
  String messegd ;
  String email ;

  messeg({required this.messegd ,required this.email});

  factory messeg.fromjson(json){
    return messeg(
        messegd:json['messeg'],
        email: json['id']
    );
  }
}