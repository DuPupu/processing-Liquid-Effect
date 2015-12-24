float[][] h;
float[][] v;
float[][] nv;


void setup(){
  frameRate(25);
  size(600,600,P3D);
  background(0);
  stroke(color(0,0,255));
  strokeWeight(1);
  rotateX(PI/2);
  rotateZ(-PI/6);

  h=new float[80][80];
  v=new float[80][80];  

  for(int i=0;i<20;i++){
    for(int j=0;j<80;j++){
      h[i][j]=-20;
      v[i][j]=0;
    }
  }
  for(int i=20;i<80;i++){
     for(int j=0;j<20;j++){
      h[i][j]=-80;
      v[i][j]=0;
    }
    for(int j=20;j<80;j++){
      h[i][j]=30;
      v[i][j]=0;
    }
  }

}
float i=0;
int dh=0;
  int ps = 0;

void draw(){
 

    translate(width/2, height/2, 0);

    nv=new float[80][80];
  for(int i=0;i<80;i++){
    for(int j=0;j<80;j++){
      int subc=0;
      int subv=0;
      for (int k=-15;k<16;k++){
        if ((j+k >=0) && (j+k <80)){
          for (int l=-15;l<16;l++){
            if ((i+l >=0) && (i+l <80)){
              subv+=(h[i+l][j+k]-h[i][j]);
              subc+=1;
            }
          }
        }
      }
      if(subc!=0){subv=subv/subc;}
      nv[i][j]=subv*.01;
    }
  }
  
  for(int i=0;i<80;i++){
    for(int j=0;j<80;j++){
      v[i][j]=v[i][j]*.999+nv[i][j];
      h[i][j]=h[i][j]+v[i][j];
    }
  }
  
  
  
  
  i=i+.01;
  clear();
rotateX(PI/2.8);
rotateZ(-PI/3+i);
  for(int i=0;i<79;i++){
    for(int j=0;j<79;j++){
      beginShape(POINTS);
      vertex(i*4-160,j*4-160,h[i][j]+dh);
      vertex((i+1)*4-160,j*4-160,h[i+1][j]+dh);
      vertex(i*4-160,(j+1)*4-160,h[i][j]+dh);
      endShape();

    }
 }
//fill(60,32,0);
beginShape(LINES);
  vertex(0-160,0-160,0);
  vertex(320-160,0-160,0);
  vertex(320-160,320-160,0);
  vertex(0-160,320-160,0);
endShape(CLOSE);


}
