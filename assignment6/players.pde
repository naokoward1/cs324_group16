class Players{
  ArrayList<player> players_list;
  Players(){
    players_list=new ArrayList<player>();
  }
  
  void add_player(player p){
    players_list.add(p);
  }
  
  
  void run(float soccer_x){
    for(int i=players_list.size()-1;i>=0;i--){
      player p=players_list.get(i); 
      p.run(i+1,soccer_x);
      
      
    }
  }
  
}
  
