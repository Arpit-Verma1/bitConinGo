# bitConinGo - Crypto Portfolio Management App

A modern iOS cryptocurrency portfolio management application built with SwiftUI and MVVM architecture. The app provides comprehensive analytics, exchange functionality, transaction records, and wallet management for crypto enthusiasts.

## 📱 Features

### 🏠 Analytics Dashboard
- **Portfolio Overview**: Real-time portfolio value display with Bitcoin/Cash toggle
- **Interactive Charts**: Portfolio performance visualization with multiple timeframes
- **Crypto Holdings**: Individual cryptocurrency holding cards with performance metrics
- **Recent Transactions**: Transaction history with detailed information
- **Currency Toggle**: Switch between Bitcoin and Cash views

### 💱 Exchange & Balance
- **Stacked Balance Cards**: Layered card design showing total balance with daily changes
- **Action Buttons**: Send, Add, and Receive functionality
- **Transaction List**: Recent transactions with navigation to detail views
- **Balance Tracking**: Real-time balance updates with percentage changes

### 📊 Exchange Detail
- **Currency Conversion**: Convert between different cryptocurrencies and fiat
- **Exchange Rates**: Real-time exchange rates with spread information
- **Gas Fee Calculation**: Network fee estimation for transactions
- **Swap Interface**: Intuitive currency swapping with visual feedback

### 📋 Record Management
- **Transaction History**: Comprehensive transaction records
- **Filtering Options**: Search and filter transactions by type, date, or amount
- **Export Capabilities**: Export transaction data for accounting purposes

### 👛 Wallet Management
- **Multi-Wallet Support**: Manage multiple cryptocurrency wallets
- **Security Features**: Secure wallet access and transaction signing
- **Backup & Recovery**: Wallet backup and recovery options

## 🏗️ Project Structure

```
bitConinGo/
├── bitConinGoApp.swift              # App entry point
├── Extension/
│   └── Color.swift                  # Custom color theme
├── Core/
│   ├── MainView.swift               # Main container view
│   ├── MainViewModel.swift          # App state management
│   ├── Analytics/
│   │   ├── View/
│   │   │   └── AnalyticsView.swift  # Analytics dashboard
│   │   └── ViewModels/
│   │       └── AnalyticsViewModel.swift
│   ├── Exchange/
│   │   ├── View/
│   │   │   ├── ExchangeView.swift   # Exchange main view
│   │   │   └── ExchangeDetailView.swift
│   │   └── ViewModels/
│   │       ├── ExchangeViewModel.swift
│   │       └── ExchangeDetailViewModel.swift
│   ├── Record/
│   │   └── View/
│   │       └── RecordView.swift     # Transaction records
│   ├── Wallet/
│   │   └── View/
│   │       └── WalletView.swift     # Wallet management
│   └── Components/
│       ├── AddButton.swift          # Circular add button
│       ├── CurrencyToggleView.swift # Bitcoin/Cash toggle
│       ├── TimeframeSelector.swift  # Chart timeframe selector
│       ├── PortfolioChart.swift     # Portfolio performance chart
│       ├── CryptoHoldingCard.swift  # Individual crypto cards
│       ├── TransactionRow.swift     # Transaction list items
│       ├── ActionButton.swift       # Send/Add/Receive buttons
│       ├── StackedCards.swift       # Layered balance cards
│       ├── ExchangeSection.swift    # Exchange input sections
│       ├── ExchangeDetailRow.swift  # Exchange detail items
│       ├── CurrencySelector.swift   # Currency selection
│       ├── NetworkImageView.swift   # Network image loading
│       ├── TabButton.swift          # Custom tab buttons
│       ├── ExchangeCard.swift       # Exchange cards
│       └── SwapButton.swift         # Currency swap button
└── Assets.xcassets/                 # App assets and colors
```

## 🛠️ Technical Architecture

### **MVVM Pattern**
- **Models**: Data structures for crypto holdings, transactions, and user data
- **Views**: SwiftUI views for UI presentation
- **ViewModels**: Business logic and state management using Combine

### **Key Technologies**
- **SwiftUI**: Modern declarative UI framework
- **Combine**: Reactive programming for state management
- **iOS 26**: Latest iOS features including TabView with glass effects
- **NavigationStack**: Modern navigation API

### **Design Patterns**
- **Reusable Components**: Modular SwiftUI components for consistency
- **Custom Color Theme**: Centralized color management
- **Network Image Loading**: Efficient image loading from URLs
- **Custom Shapes**: RoundedCorner for specific corner radius control

## 🚀 Setup Instructions

### Prerequisites
- Xcode 15.0 or later
- iOS 16.0+ deployment target
- macOS 14.0+ for development

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd bitConinGo
   ```

2. **Open in Xcode**
   ```bash
   open bitConinGo.xcodeproj
   ```

3. **Configure Assets**
   - Ensure all required images are in `Assets.xcassets/`
   - Verify color assets are properly configured for light/dark mode

4. **Build and Run**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run the project

### Asset Requirements
- `bell.imageset`: Notification bell icon
- `bitCoin.imageset`: Bitcoin logo
- `cash.imageset`: Cash/currency icon
- Color assets: `AccentColor`, `BackgroundColor`, `GreenColor`, `RedColor`, etc.

## 📱 UI/UX Features

### **Modern Design**
- Glass effect bottom navigation (iOS 26)
- Linear gradients for visual appeal
- Rounded corners and shadows for depth
- Responsive layout for different screen sizes

### **Interactive Elements**
- Smooth animations and transitions
- Haptic feedback for user interactions
- Gesture recognition for enhanced UX
- Dynamic content updates

### **Accessibility**
- VoiceOver support
- Dynamic Type compatibility
- High contrast mode support
- Reduced motion preferences

## 🔧 Known Limitations

### **Current Limitations**
1. **Mock Data**: App currently uses static mock data for demonstration
2. **Network Integration**: No real API integration for live crypto data
3. **Authentication**: No user authentication or secure storage
4. **Offline Support**: Limited offline functionality
5. **Push Notifications**: No push notification implementation

### **Performance Considerations**
- Large image assets may impact app size
- Network image loading without caching
- No data persistence between app launches

## 🚧 Areas for Improvement

### **High Priority**
1. **Real API Integration**: Connect to cryptocurrency APIs for live data
2. **Data Persistence**: Implement Core Data or UserDefaults for data storage
3. **Authentication**: Add user authentication and secure wallet access
4. **Push Notifications**: Implement price alerts and transaction notifications

### **Medium Priority**
1. **Offline Support**: Cache data for offline viewing
2. **Image Caching**: Implement efficient image caching for network images
3. **Error Handling**: Comprehensive error handling and user feedback
4. **Unit Tests**: Add unit tests for ViewModels and business logic

### **Low Priority**
1. **Widgets**: iOS home screen widgets for quick portfolio view
2. **Apple Watch**: Companion app for Apple Watch
3. **iCloud Sync**: Synchronize data across devices
4. **Dark Mode**: Enhanced dark mode support

## 📄 License

This project is for educational and demonstration purposes. Please ensure compliance with relevant cryptocurrency and financial regulations before using in production.

## 👨‍💻 Development Timeline

- **August 11, 2025**: Core foundation and app structure
- **August 12, 2025**: Analytics dashboard implementation
- **August 13, 2025**: Exchange and balance features
- **August 14, 2025**: Components and remaining features

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request


