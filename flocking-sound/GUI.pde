ControlP5 cp5;

void setupGui() {
  cp5.addSlider("lowestFreq")
    .setPosition(10, 10)
    .setRange(100, 800)
    .setValue(400)
    ;

  cp5.addSlider("octaves")
    .setPosition(10, 20)
    .setRange(-2, 4)
    .setValue(2)
    .setNumberOfTickMarks(7)
    .setSliderMode(Slider.FLEXIBLE)
    ;

  cp5.addSlider("drift")
    .setPosition(10, 30)
    .setRange(-1.5, 1.5)
    .setValue(0.15)
    ;

  cp5.addRadioButton("divMode")
    .setPosition(10, 40)
    .setSize(10, 10)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setItemsPerRow(2)
    .setSpacingColumn(60)
    .addItem("CONTINUOUS", 0)
    .addItem("DISCRETE", 1)
    .setValue(1);
  ;

  cp5.addSlider("scaleMode")
    .setPosition(10, 50)
    .setRange(-12, 12)
    .setValue(1)
    .setNumberOfTickMarks(25)
    .setSliderMode(Slider.FLEXIBLE)
    ;

  cp5.addSlider("turnMag")
    .setPosition(10, 60)
    .setRange(-0.02, 0.02)
    .setValue(0)
    .setDecimalPrecision(4);
  ;

  cp5.addSlider("curlMag")
    .setPosition(10, 70)
    .setRange(-0.02, 0.02)
    .setValue(0)
    .setDecimalPrecision(4);
  ;

  cp5.addSlider("sepWeight")
    .setPosition(10, 80)
    .setRange(-1, 8)
    .setValue(1.5)
    .setDecimalPrecision(3);
  ;

  cp5.addSlider("aliWeight")
    .setPosition(10, 90)
    .setRange(-1, 2)
    .setValue(1)
    .setDecimalPrecision(3);
  ;

  cp5.addSlider("cohWeight")
    .setPosition(10, 100)
    .setRange(-1, 2)
    .setValue(1)
    .setDecimalPrecision(3);
  ;
}

void controlEvent(ControlEvent e) {
  if (e.isFrom("lowestFreq")) {
    logLowestFreq = log(e.getValue());
  } else if (e.isFrom("octaves")) {
    octaves = floor(e.getValue());
  }
  // "drift" automatically handled by ControlP5
  else if (e.isFrom("divMode")) {
    if (e.getValue() == 0) {
      divMode = CONTINUOUS;
    } else {
      divMode = DISCRETE;
    }
  }
  // "scaleMode" automatically handled by ControlP5
}
