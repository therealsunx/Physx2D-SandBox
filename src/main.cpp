#include "./applications/boid_sim.h"
#include "./applications/cellularAutomata.h"
#include "./applications/MNCA.h"
#include "./applications/WaveFuncCollapseApp.h"
#include "./applications/PhysicsTestApp.h"

int main(int argc, char** argv){
  printf("---- PHYSX2D ----");

  Physx2D::Application* app = new PhysicsTestApp();

  app->Run();

  delete app;

  return 0;
}
