#include "diablo_utils/diablo_tools/osdk_movement.hpp"
#include "diablo_utils/diablo_tools/osdk_header.hpp"
#include "diablo_utils/diablo_tools/osdk_hal.hpp"
#include "diablo_utils/diablo_tools/osdk_vehicle.hpp"

int main() {
  // Initialize the HAL and Vehicle objects
  DIABLO::OSDK::HAL hal;
  DIABLO::OSDK::Vehicle vehicle(&hal);

  // Obtain control of the robot
  if (vehicle.movement_ctrl.obtain_control()) {
    std::cerr << "Failed to obtain control" << std::endl;
    return -1;
  }

  // Set the movement control mode to Cartesian
  if (vehicle.movement_ctrl.SendMovementModeCtrlCmd()) {
    std::cerr << "Failed to set movement control mode" << std::endl;
    return -1;
  }

// Set the movement command to move forward at 0.5 m/s for 5 seconds
   vehicle.movement_ctrl.ctrl_data.vx = 0.5f;
   vehicle.movement_ctrl.ctrl_data.vy = 0;
   vehicle.movement_ctrl.ctrl_data.vz = 0;
   vehicle.movement_ctrl.ctrl_data.yaw = 0;
   vehicle.movement_ctrl.ctrl_data.duration = 5000; // 5 seconds in milliseconds

  // Send the movement command
  if (vehicle.movement_ctrl.SendMovementCtrl()) {
    std::cerr << "Failed to send movement control command" << std::endl;
    return -1;
  }

  // Release control of the robot
  if (vehicle.movement_ctrl.release_control()) {
    std::cerr << "Failed to release control" << std::endl;
    return -1;
  }

  return 0;
}
