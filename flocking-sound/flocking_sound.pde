/**
 * Flocking
 * by Daniel Shiffman.
 *
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on
 * rules of avoidance, alignment, and coherence.
 *
 * Click the mouse to add a new boid.
 */

/**
 * Addition for sound
 * by random-entity.
 *
 * Each boid now has an oscillator with it,
 * and its frequency depends on its velocity direction,
 * so they sound in tune when their directions are aligned.
 *
 * Search for "Addition for sound" to see where some lines of code is added for making sound.
 */

import processing.sound.*;
import controlP5.*;

Flock flock;

void setup() {
  size(700, 700);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 50; i++) {
    flock.addBoid(new Boid(random(width), random(height), this));
  }
  
  cp5 = new ControlP5(this);
  setupGui();
}

void draw() {
  background(63);
  flock.run();
}

// Add a new boid into the System
// TODO: Switch to mouseDragged
void mousePressed() {
  if (mouseButton == LEFT) {
    flock.addBoid(new Boid(mouseX, mouseY, this));
  } else if (mouseButton == RIGHT) {
    flock.removeFirstBoid();
  }
}
