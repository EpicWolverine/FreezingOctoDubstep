float timeOffset = 0.0;
float BallY;
float V;
float A;
int EndState;
float PosGraphX;
float VelGraphX;
float AccGraphX;
ArrayList<Float> PosPoints;
ArrayList<Float> VelPoints;
ArrayList<Float> AccPoints;

void setup(){ 
  size(600,700);
  frameRate(60);
  background(255);
  
  //Initilize variables
  timeOffset = millis();
  BallY=200;
  V=0.8;
  A=1.2;
  EndState=0;
  PosGraphX=50;
  VelGraphX=50;
  AccGraphX=50;
  PosPoints = new ArrayList<Float>();
  VelPoints = new ArrayList<Float>();
  AccPoints = new ArrayList<Float>();
}

void draw(){ 
  float time0 = millis() - timeOffset;
  time0 = time0/1000;
  if(EndState==1){
    stroke(0);
    fill(255,0,0); 
    rect(250,650,100,40);
    fill(255);
    textAlign(CENTER);
    text("Reset",300,675);
  }
  else{
    //BALL PHYSICS
    background(255);
    fill(255); ellipse(500,BallY,50,50);
    fill(128,0,128); ellipse(500,BallY,50,50);
    BallY=BallY+V; V+=A;
    if(BallY>=600){ BallY=600; V=V*.7; V=-V; /*println("BOUNCE")*/; 
    if (abs(V)<5){ BallY=600; V=0; A=0; EndState=1; }}
    
    //GRAPHS SETUP
    fill(0); stroke(0); strokeWeight(2);
    line(50,50,50,200); line(50,200,400,200); 
    line(50,250,50,400); line(50,325,400,325);
    line(50,450,50,600); line(50,525,400,525);
    
    //TIMING
    //float time1=millis()-time0;
    String s = "t = " + truncate(time0);
    float POS=600-BallY;
    String POS1 = "X = " + truncate(POS);
    String V1 = "V = " + truncate(-V);
    String A1 = "A = " + truncate(-A);
    textSize(16);
    textAlign(LEFT);
    text(POS1,410,135);
    text(V1,410,335);
    text(A1,410,535);
    text(s,50,675);
    
    //GRAPHING
    //position
    float PosGraphY = POS/3;
    fill(255,0,0); 
    strokeWeight(3); 
    stroke(255,0,0); 
    ellipse(PosGraphX,200-PosGraphY,5,5); 
    PosGraphX+=(1.5);
    if(PosGraphX>=400){
      EndState=1;
    }
    
    PosPoints.add(POS/3);
    //println(PosPoints);
    if(PosPoints.size() != 1){
      for(int point = 1; point < PosPoints.size(); point++){
        line(50+(1.5*(point-1)), 200-PosPoints.get(point-1), 50+(1.5*(point)), 200-PosPoints.get(point));
      }
    }  
    //velocity
    float VelGraphY = -V;
    fill(255,0,0); 
    strokeWeight(3); 
    stroke(255,0,0); 
    ellipse(VelGraphX,325-VelGraphY,5,5); 
    VelGraphX+=(1.5);
    
    VelPoints.add(-V);
    //println(VelPoints);
    if(VelPoints.size() != 1){
      for(int point = 1; point < VelPoints.size(); point++){
        line(50+(1.5*(point-1)), 325-VelPoints.get(point-1), 50+(1.5*(point)), 325-VelPoints.get(point));
      }
    }
    //acceleration
    float AccGraphY = -A*5;
    fill(255,0,0); 
    strokeWeight(3); 
    stroke(255,0,0); 
    ellipse(AccGraphX,525-AccGraphY,5,5); 
    AccGraphX+=(1.5);
    
    AccPoints.add(-A*5);
    //println(VelPoints);
    if(AccPoints.size() != 1){
      for(int point = 1; point < AccPoints.size(); point++){
        line(50+(1.5*(point-1)), 525-AccPoints.get(point-1), 50+(1.5*(point)), 525-AccPoints.get(point));
      }
    }
  }
}

void keyPressed() {
  if(EndState==1){
    setup();
  }
}

void mouseClicked() {
  if(EndState==1){
    if(mouseX > 250 && mouseX <= 350 && mouseY > 650 && mouseY <= 690){
      setup();
    }
  }
}

float truncate(float x){ //via https://processing.org/discourse/beta/num_1224871364.html
  if ( x > 0 )
    return float(floor(x * 100))/100;
  else
    return float(ceil(x * 100))/100;
}
