# 🎯 RePoints Level System

## Sistem Level 4-Tier (Unified)

Level dan Pencapaian menggunakan sistem yang **sama** untuk konsistensi UX.

### Tier Breakdown

| Tier | Level Name      | Points Range  | Color            | Icon                  |
| ---- | --------------- | ------------- | ---------------- | --------------------- |
| 1    | Eco Rookie      | 0 - 2,499     | Gold `#FFB74D`   | 🥉 military_tech      |
| 2    | Green Warrior   | 2,500 - 3,999 | Green `#4CAF50`  | 💚 volunteer_activism |
| 3    | Planet Guardian | 4,000 - 5,999 | Blue `#2196F3`   | 🌍 public             |
| 4    | Champion        | 6,000+        | Purple `#9C27B0` | ⭐ star               |

**Note:** Level names dan badge names sekarang **konsisten** di Dashboard dan Profile

### Implementation Locations

#### 1. **Level Logic** (`lib/app/repoint_shell.dart`)

```dart
String get _levelLabel {
  if (_userPoints >= 6000) return 'Champion';
  if (_userPoints >= 4000) return 'Planet Guardian';
  if (_userPoints >= 2500) return 'Green Warrior';
  return 'Eco Rookie';
}
```

#### 2. **Dashboard Display** (`lib/features/home/home_page.dart`)

- Hero card shows: `"Level: $levelLabel ⭐"`
- Header shows: level name below user greeting

#### 3. **Profile Achievements** (`lib/features/profile/profile_page.dart`)

- 4 achievement badges matching level tiers
- Current level has colored border (3px width)
- "Aktif" badge shown on current level
- Tooltip shows point requirements

### Current User State (Default)

- **Points:** 1,500
- **Level:** Eco Rookie (Tier 1)
- **Next Level:** Green Warrior at 2,500 points
- **Points Needed:** 1,000 more points

### Testing Points

To test each level, change `_userPoints` in `repoint_shell.dart` (line 51):

```dart
int _userPoints = 1500;   // Eco Rookie (default)
int _userPoints = 2500;   // Green Warrior
int _userPoints = 4000;   // Planet Guardian
int _userPoints = 6500;   // Champion
```

### Visual Indicators

**Dashboard (Home):**

- Shows current level name in hero card
- Green gradient background
- White text with star emoji

**Profile (Achievements):**

- All 4 badges displayed
- Current level: colored border + "Aktif" badge
- Lower levels: gray/desaturated
- Higher levels: gray/locked appearance

### Consistency Checklist

✅ Level names match across all pages
✅ Point thresholds identical in all locations
✅ 4 tiers available (added Champion tier)
✅ Badge colors match level colors
✅ Visual feedback for current level
✅ Tooltips show requirements

### Notifications System

**Responsive Notifications:**

- ✓ Setoran diterima: Auto-create notification saat setor sampah
- 🎁 Penukaran berhasil: Auto-create notification saat tukar reward
- Swipe to delete: Geser notifikasi untuk menghapus
- Color-coded: Hijau untuk deposit, Orange untuk redemption

### Notes

- Level updates automatically when points change
- No manual refresh needed (reactive state)
- Achievements sync with dashboard level
- Notifications trigger on point changes
- Achievement badges support multi-line text (no overflow)
- Text centered with 70px width container
