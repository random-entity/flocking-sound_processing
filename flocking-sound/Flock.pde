// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    if (boids.size() > 1000) return;
    boids.add(b);
  }

  void removeFirstBoid() {
    if (boids.isEmpty()) return;
    boids.get(0).osc.stop();
    boids.remove(0);
  }
}
