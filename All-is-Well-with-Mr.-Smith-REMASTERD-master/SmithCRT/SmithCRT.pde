import processing.sound.*;
SoundFile bgm;



Bowling bowlingball1; ///IMPOSSIBLE BUTTON CLASS///
int disp = 0;///IMPOSSIBLEBUTTON DISPLAY///
int holding;
PImage img;///IMPOSSIBLEBUTTON CURSOR///

int ending1counter;//ending1countdown
PImage ending1;
PImage ending2;///ending2arrow

ArrayList particles = new ArrayList(); ///PARTICLE BUTTONS READY///
int typecounter;
int stage; ///TAG ALL THE IF@STAGES
int stgL; //LOADING THE STAGE

boolean doOnce = true;//TimerReset

int buttonX, buttonY;
int buttonSize;
boolean buttonHover = false;
boolean buttonStandby = false;
int xs = 20;
int ys = -30; ///BUTTON SPEED
int catchButtonCounter; ///CATCH BUTTON TIMER

PFont f;
PImage title;
String ntv1 = "Mr.Smith wakes up today, in front of him are 3 buttons as usual. Mr.Smith's job is to push the button which the system tells him to push. Today, the system asks him to push the RED button.               ";
String ntv2 = "As always, Mr.Smith did his job well, and never ask why. Does he ever think about the consequence that would come by pressing these buttons?                       Do you, Mr.Smith?                         ";
String ntv3 = "What if I tell you, the button you just pressed released poisonous gas and killed a young teenage girl? Or did you just save an old man by turning on his pacemaker?             I'll let you press the button again. You have a chance to make your own choice this time. But always remember what the system told you.";
String ntv4 = "Very well done, Mr.Smith. You have proved you are a loyal employee in the ministry of truth. ";
String ntv4a = "THE BIG BROTHER LOVES YOU.";
String ntv5  = "Impressive... It seems like Mr.Smith has developed an idea of free will. For the first time, he chooses to disobey the system.                    But, is it possible...?                    ";
String ntv5a = "But, is it possible...?                              ";
String ntv6  = "Let's try this again. Go ahead press the grey button you just did.";
String ntv7  = "It's not that hard to follow the instructions, isn't it? Mr. Smith.                   You've already pressed the red button once, would you mind pressing it again?";
String ntv8  = "So, press the red button, Mr. Smith. Please, FOLLOW THE INSTRUCTION.";
String ntv9  = ".    .    .                   It looks like you are so into these gray buttons. How about I just let you push it.                          ";
String ntv10 = "...if you can catch it.                       ";
String ntv11 = "Look how slow you are, Mr.Smith. You can't even push a button on your own.                         Alright, alright, alright. I'll set it steady for you.";
String ntv11a= "Oh I change my mind, it's actually a red button. You know you don't have much choice right? Mr. Smith.";
String ntv12 = "It's just like your life, Mr.Smith. You are angry, you are afraid, and you want to quit.                       It's ok, just click the exit button on the top left. But you know what, that is also a red button.                                      ";

void setup(){
  background(255);
  smooth();
  frameRate(23);
  size(1280, 800);
  f = createFont("Dosis-Regular.ttf", 24);
  textFont(f);
  stage = 0; stgL = 0; //reset the stage//
  title = loadImage("Title.png");
  imageMode(CENTER);
  
  bgm = new SoundFile(this, "bgm.mp3");
  bgm.loop();
  image(title, width/2, height/2);
  buttonX = width/2;
  buttonY = height/3*2;
  
  ending2 = loadImage("arrow.png");
  
  
  
  ///IMPOSSIBLE BUTTON STANDBY///
  img=loadImage("cursor01.png");
  bowlingball1 = new Bowling();
  ///IMPOSSIBLE BUTTON STANDBY///
  
  ///PARTICLE BUTTONS STANDBY///
  //for(int i = 0; i < 100; i++){
  //  particles.add(new Shoot(new PVector(width/2, height/2))); 
  //}
  ///PARTICLE BUTTONS STANDBY///
}

void draw(){
  
  
  
  //STAGE 0 - TITLE//
  if (stage == 0 && mousePressed == true){
    stage = 1;
  }
  //STAGE 0 END//
  
  //STAGE 1 - Begin with 3 buttons//
  if (stage == 1){
    drawCRT(0, 100);
    fill(255);
    typewriter(ntv1);
    stgL = 1;
  }
  if (typecounter >= ntv1.length() && stgL ==1){
    drawRedButton(width/3, height/3*2);
    drawWhiteButton(width/2, height/3*2);
    drawGreyButton(width/3*2, height/3*2);
    buttonStandby = true;
  }
  //stg1pressthered-------------------------------------------------------LINE1 START!!!!!!!!!!
  //pressRed//
  if (stgL==1 && 
  buttonStandby == true && 
  mousePressed == true && 
  mouseX <= width/3+40 &&
  mouseX >= width/3-40 &&
  mouseY >= height/3*2-40 &&
  mouseY <= height/3*2+40){
    stage = 2;
    typecounter = 0;
    buttonStandby = false;
  }  
  
  /////////STAGE 2- First time press red//
  if (stage == 2){
    drawCRT(0, 100);
    fill(255);
    typewriter(ntv2);
    stgL = 2;
  }
  if (typecounter >= ntv2.length() && stgL == 2){
    drawRedButton(width/2, height/3*2);
    buttonStandby = true;
  }

  if (stgL==2 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/2+40 &&
    mouseX >= width/2-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
    stage = 3;
    typecounter = 0;
    buttonStandby = false;
  }  
  //STAGE 3
  if(stage == 3){
    drawCRT(0, 100);
    fill(255);
    typewriter(ntv3);
    stgL=3;
  }
  if(typecounter >= ntv3.length() && stgL == 3){
    drawRedButton(width/3, height/3*2);
    drawGreyButton(width/3*2, height/3*2);
    buttonStandby = true;
  }
  if(stgL==3 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/3+40 &&
    mouseX >= width/3-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
    drawCRT(0, 100);
    stage = 4;
    typecounter = 0;
    buttonStandby = false;
    }else if(stgL==3 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/3*2+40 &&
    mouseX >= width/3*2-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
    drawCRT(0, 100);
    stage = 21;
    typecounter = 0;
    buttonStandby = false;
    }
   //STAGE 3 ENDS//
   
   //STAGE 4//
   if(stage == 4){
     fill(150,0,0,4); 
     rect(width/2, height/2, width, height);
     fill(255);
     typewriter(ntv4);
     stgL = 4;
   }
   if(typecounter >= ntv4.length() && stgL == 4){
    drawRedButton(width/2, height/3*2);
    buttonStandby = true;
  }
   if (stgL==4 && 
      buttonStandby == true && 
      mousePressed == true && 
      mouseX <= width/2+40 &&
      mouseX >= width/2-40 &&
      mouseY >= height/3*2-40 &&
      mouseY <= height/3*2+40){
      stage = 5;
      typecounter = 0;
      buttonStandby = false;
    }  
   //STAGE 4 ENDS//
   
   ////ENDING1////
   if (stage == 5){
     fill(0);
     textSize(40);
     for (int i=0; i<2000; i++){
       rectMode(CENTER);
       fill(255, 0, 0);
       text("The Big Brother Loves You", 0, height/4+(i*40));
       text("The Big Brother Loves You", width/3, height/4+(i*40));
       text("The Big Brother Loves You", width/3*2, height/4+(i*40));
     }
     
     if(doOnce == true){
     ending1counter = millis();
     doOnce = false;
     }
     stgL = 5;
   }
   if (stgL == 5 && millis() - ending1counter >= 2000){
      background(255);
      ending1 = loadImage("illuminati.jpg");
      image(ending1, width/2, height/2);
      imageMode(CENTER);
      println("illuminati");
   }
   if (stgL == 5 && millis() - ending1counter > 2700){
     exit();
   }
  ////ENDS OF ENDING 1////
  
  
  
  
  
  
  
  
  
  
  
  
  
     //stg2presstheothers------------------------------------------------LINE2 START!!!!!!!!!!
  if (stgL==1 && 
    buttonStandby == true && 
    mousePressed == true&& 
    mouseX <= width/2+40 &&
    mouseX >= width/2-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
      stage = 21;
      typecounter = 0;
      buttonStandby = false;
    }  
    
  if (stgL==1 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/3*2+40 &&
    mouseX >= width/3*2-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
      stage = 21;
      typecounter = 0;
      buttonStandby = false;
    }  
    
  if (stage == 21) {
    drawCRT(0, 100);
    fill(255);
    typewriter(ntv5);
    stgL = 21;
  }
  
  if(typecounter >= ntv5.length() && stgL == 21){
    stage = 211;
    typecounter = 0;
  }
  
  if(stage == 211){
    drawCRT(0, 100);
    fill(255);
    typewriter(ntv6);
    stgL = 211;
    buttonStandby = false;
  }
  
  if(typecounter >= ntv6.length() && stgL==211){
    drawRedButton(width/3, height/3*2);
    drawRedButton(width/2, height/3*2);
    drawRedButton(width/3*2, height/3*2);
    buttonStandby = true;
   
  }
  
 if (stgL==211 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/3+40 &&
    mouseX >= width/3-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
    stage = 22;
    typecounter = 0;
   
  }else if (stgL==211 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/2+40 &&
    mouseX >= width/2-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
    stage = 22;
    typecounter = 0;
   
  }else if (stgL==211 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/3*2+40 &&
    mouseX >= width/3*2-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
    stage = 22;
    typecounter = 0;  
  } 
  
  //STAGE22//
  if (stage == 22){
   drawCRT(0, 100);
    buttonStandby = false;
    fill(255);
    stgL = 22;
  }
  
  if(stgL == 22){
    typewriter(ntv7);
  }
  
  if(typecounter >= ntv7.length() && stgL == 22){   
    drawRedButton(width/3, height/3*2);
    drawGreyButton(width/3*2, height/3*2);
    buttonStandby = true;
    stgL = 221;
  }
  ///Press Red back to storyline 1///
  if(stgL==221 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/3+40 &&
    mouseX >= width/3-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
    drawCRT(0, 100);
    stage = 2;
    typecounter = 0;
    buttonStandby = false;
  }
   ///Press Grey enter the META GAME    
    else if(stgL==221 && 
    buttonStandby == true && 
    mousePressed == true && 
    mouseX <= width/3*2+40 &&
    mouseX >= width/3*2-40 &&
    mouseY >= height/3*2-40 &&
    mouseY <= height/3*2+40){
    drawCRT(0, 100);
    stage = 23;
    typecounter = 0;
    buttonStandby = false;
    }

  if (stage == 23){
    drawCRT(0, 80);
    fill(255, 0, 0);
    typewriter(ntv9);
    stgL = 23;
  }
  
  if(typecounter >= ntv9.length() && stgL == 23){
    drawCRT(0, 70);
    stage = 231;
    typecounter = 0;
  }
  
  
  if(stage == 231){
    drawCRT(0, 90);
    typewriterSpecial(ntv10);
    stgL = 231;
  }
  
  if(typecounter >= ntv10.length() && stgL == 231){
    drawCRT(0, 100);
    doOnce = true;
    stage = 232;   
  }
  
  if(stage == 232){
    frameRate(60);
    drawCRT(0, 100);
    catchButton();
      if (doOnce == true) {
        catchButtonCounter = millis();
        doOnce = false;
      }
    stgL = 232;
  }
  
  if(stgL == 232 &&  millis() - catchButtonCounter >3000){
    stage = 24;
    typecounter = 0;
    doOnce = true;  
  }
  
  if(stage == 24){
    frameRate(16);
    drawCRT(0, 30);
    fill(255);
    typewriter(ntv11);
    
    stgL = 24;
  }
  
  if(typecounter >= ntv11.length() && stgL ==24){
    drawGreyButton(width/2, height/3*2);
    buttonStandby = true;
  }
  
  if(stgL==24 && 
    buttonStandby == true &&  
    mouseX <= width/2+120 &&
    mouseX >= width/2-120 &&
    mouseY >= height/3*2-120 &&
    mouseY <= height/3*2+120){
    stage = 25;
    typecounter = 0;
    buttonStandby = false;  
    }
    
   if(stage == 25){
     drawCRT(0, 30);
     drawRedButton(width/2, height/3*2);
     buttonStandby = true;
     typewriter(ntv11a);
     stgL = 25;
   }
   if(stgL == 25 &&
      buttonStandby == true && 
      mousePressed == true && 
      mouseX <= width/2+40 &&
      mouseX >= width/2-40 &&
      mouseY >= height/3*2-40 &&
      mouseY <= height/3*2+40){
      println("Catched");
      drawCRT(0, 30);
      stage = 26;
      typecounter = 0;
      buttonStandby = false;
   }
    if(stage ==26){
      rectMode(CORNER);
      fill(255, 5);
      rect(0, 0, width, height);
      fill(0);
      typewriter(ntv12);
      stgL = 27;
    }
    if(typecounter >= ntv12.length() && stgL == 27){
      background(255);
      frameRate(60);
      imageMode(CORNER);
      image(ending2, 0, 0); 
      println("ending2");
      drawGreyButton(width/2, height/2);
      bowlingball1.update();
      bowlingball1.display();
      
    }
}













///CRT BACKGROUND///
void drawCRT(int a, int b){
  background(0);
  loadPixels();
  for(int x=0; x<pixels.length; x++)
  {
    pixels[x] = color( random(a, b));
  }
  updatePixels();
}






///TYPEWRITTER ANIMATION///
void typewriter(String ntv){
  if(typecounter<ntv.length()){
    typecounter++;
  }  
  rectMode(CENTER);
  text(ntv.substring(0, typecounter), width/2, height/4, height/5*4, width/5);
}

void typewriterSpecial(String ntv){
  if(typecounter<ntv.length()){
    typecounter++;
  }  
  rectMode(CENTER);
  text(ntv.substring(0, typecounter), width/2, height/2, height/5*4, width/5);
}
///TYPEWRITTER ANIMATION ENDS///


///DRAW BUTTON///
void drawRedButton(int x, int y){
  noStroke();
  fill(130, 0, 0);
  ellipse(x+3, y+3, 85, 85);
  fill(255, 0, 0);
  ellipse(x, y, 80, 80); 
}

void drawGreyButton(int x, int y){
  
  noStroke();
  fill(40, 40, 40);
  ellipse(x+3, y+3, 85, 85);
  fill(80, 80, 80);
  ellipse(x, y, 80, 80);
}

void drawWhiteButton(int x, int y){
  noStroke();
  fill(80, 80, 80);
  ellipse(x+3, y+3, 85, 85);
  fill(140, 140, 140);
  ellipse(x, y, 80, 80);
}

//Catch the Button////
void catchButton(){
  frameRate(60);
  fill(80, 80, 80);
  drawGreyButton(buttonX, buttonY);
  if (buttonY >= height) {
          ys = ys * -3/2;
  } else if (buttonY <= 0) {
          ys = ys * -3/2;
  }      
  if (buttonX >= width) {
          xs = xs * -3/2;
  } else if (buttonX <= 0) {
          xs = xs * -3/2;
  }
      buttonX = buttonX + xs;
      buttonY = buttonY + ys;
}



///NEUROBUTTONS ENDING///