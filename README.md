# Platformer Game

A 2D platformer game built with Godot Engine 4.5. Navigate through challenging levels, collect coins, avoid enemies, and reach the finish line before time runs out!

## 🎮 Features

- **Multiple Levels**: Three challenging levels to complete
- **Time Challenge**: Each level has a countdown timer - complete before time runs out!
- **Coin Collection**: Collect coins throughout each level to track your progress
- **Enemy Encounters**: Avoid or outmaneuver slime enemies
- **Smooth Controls**: Responsive movement and jumping mechanics
- **Pixel Art Graphics**: Classic retro-style pixel art visuals
- **Animated Player**: Knight character with idle, run, and jump animations

## 🎯 How to Play

### Controls
- **A / Left Arrow**: Move left
- **D / Right Arrow**: Move right
- **Space**: Jump
- **ESC**: Return to main menu

### Objectives
1. Navigate through each level platform by platform
2. Collect coins along the way
3. Avoid enemies and hazards
4. Reach the finish line before the timer expires
5. If you fall into the killzone or time runs out, the level resets

### Game Mechanics
- **Timer System**: Each level starts with a countdown timer (default: 1:30)
- **Level Reset**: The level automatically resets if:
  - The timer reaches 0:00
  - You fall into the killzone (bottom of the screen)
- **Progress Tracking**: Your coin collection is tracked and displayed
- **Level Progression**: Complete a level to advance to the next one

## 🚀 Getting Started

### Requirements
- Godot Engine 4.5 or later
- The project includes all necessary assets

### Running the Game
1. Open the project in Godot Engine
2. Open `res://main_menu.tscn` or run the project
3. Click "Start" or select a level from the menu
4. Enjoy playing!

### Building
1. Open the project in Godot Engine
2. Go to **Project → Export**
3. Select your target platform
4. Configure export settings
5. Export the game

## 📁 Project Structure

```
game/
├── scenes/           # Level scenes and main menu
│   ├── level_1.tscn
│   ├── level_2.tscn
│   ├── level_3.tscn
│   └── music.tscn
├── scripts/          # Game logic scripts
│   ├── gamemanager.gd
│   └── killzone.gd
├── assets/           # Game assets (sprites, sounds, fonts)
│   └── brackeys_platformer_assets/
├── player.gd         # Player character script
├── coin.gd           # Coin pickup script
├── finish.gd         # Finish line script
├── control.gd        # Timer control script
├── main_menu.gd      # Main menu script
└── project.godot     # Godot project file
```

## 🎨 Assets

This project uses assets from:
- **Brackeys Platformer Assets** (included in `assets/brackeys_platformer_assets/`)
- Pixel art fonts and sprites

## 🔧 Configuration

### Timer Settings
The default timer settings can be modified in `control.gd`:
```gdscript
var Dseconds := 30  # Default seconds
var Dminutes := 1   # Default minutes
```

### Player Settings
Player movement settings can be adjusted in `player.gd`:
```gdscript
const SPEED = 130.0          # Movement speed
const JUMP_VELOCITY = -305.0 # Jump strength
```

## 🐛 Known Issues

- Timer resets to default values on level reload
- Some level scenes have embedded scripts that should be moved to separate files

## 🔮 Future Enhancements

- Save/load system for high scores
- Sound effects for actions (jump, coin collection, etc.)
- More levels
- Leaderboard system
- Settings menu for adjusting controls and audio

## 📝 License

See `LICENSE` file for details.

## 🙏 Credits

- Built with [Godot Engine](https://godotengine.org/)
- Assets from Brackeys Platformer Assets pack
- Developed as a learning project

---

**Have fun playing!** 🎮
