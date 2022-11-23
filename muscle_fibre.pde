//
//
int ctr = 0;
int numfibres = 4;
MuscleFibre[] fibres = new MuscleFibre[numfibres];
void setup(){
  size(400, 400);
  frameRate(10);
  for(int i=0; i<numfibres; i++)
    fibres[i] = new MuscleFibre();
}

void draw(){
  background(51);
  float[] exc = zeros(1);
  if(ctr%20==0) {
    exc[0] = 1.f;
  }
  
  ctr++;
  
  
  pushMatrix();
  translate(200, 100);
  for(int i=0; i<numfibres; i++){
    translate(0, fibres[i].w + 5);
    fibres[i].excite(exc);
    fibres[i].tick();
    fibres[i].draw();
  }
  
  
  popMatrix();
}
