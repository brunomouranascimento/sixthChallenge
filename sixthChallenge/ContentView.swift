//
//  ContentView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 03/05/22.
//

import SwiftUI


struct ContentView: View {
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        NavigationView {
            List {
                MainSectionView(mailBoxes: Mailbox.mainMockData)
                SmartSectionView(smartBoxes: Mailbox.smartMockData)
                if UIDevice.current.userInterfaceIdiom == .pad {
                    CalendarView()
                }
            }
            .navigationBarHidden(true)
        }
        .switchStyle(if: UIDevice.current.userInterfaceIdiom == .pad && orientation.isLandscape)
        .onRotate { newOrientation in
                    orientation = newOrientation
        }
    }
}

extension NavigationView {
    @ViewBuilder
    func switchStyle(if flag: Bool) -> some View {
        if flag {
            self.navigationViewStyle(DoubleColumnNavigationViewStyle())
        } else {
            self.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
 
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}
 
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}


struct MailBoxRow: View {
    var mailBox: Mailbox
    var showArrow: Bool
    
    var body: some View {
        HStack {
            if mailBox.isSystemImage {
                Image(systemName: mailBox.logo)
                    .symbolRenderingMode(.multicolor)
                    .padding(.horizontal, 8)
            } else {
                Image(mailBox.logo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal, 10)
            }
            Text(mailBox.name)
                .font(.headline)
            Spacer()
            HStack {
                Text("\(mailBox.unreadEmails)")
            }
            .foregroundColor(.gray)
        }
    }
}

struct MainSectionView: View {
    var mailBoxes: [Mailbox]
    
    var body: some View {
        Section {
            NavigationLink(destination: MailView(navigationTitle: "Todos e-mails")) {
                HStack {
                    Image(systemName: "tray.2")
                        .foregroundColor(.indigo)
                        .padding(.horizontal, 8)
                    Text("Todos e-mails")
                        .font(.headline)
                    Spacer()
                  
                    Text("77")
                        .foregroundColor(.gray)
                }
            }
            ForEach(mailBoxes, id: \.id ) { mailBox in
                NavigationLink(destination: MailView(navigationTitle: mailBox.name)) {
                    MailBoxRow(mailBox: mailBox, showArrow: true)
                }
            }
        } header: {
            HStack {
                Text("E-mails")
                    .font(.title3)
                Spacer()
                Image(systemName: "gear")
                    .font(.title2)
            }
            .padding(.horizontal, -15)
            .padding(.bottom)
            
        }
        .textCase(nil)
        .navigationTitle("E-mails")
        
    }
}

struct SmartSectionView: View {
    var smartBoxes: [Mailbox]
    
    var body: some View {
        
        Section {
            ForEach(smartBoxes, id: \.id ) { smartBox in
                MailBoxRow(mailBox: smartBox, showArrow: false)
            }
        } header: {
            HStack {
                Text("Caixas inteligentes")
                    .font(.title3)
                Spacer()
                Image(systemName: "gear")
                    .font(.title2)
            }
            .padding(.horizontal, -15)
            .padding(.bottom)
            
        } footer: {
            if UIDevice.current.userInterfaceIdiom != .pad {
                LastSyncView()
            }
        }
        .textCase(nil)
        
    }
}

struct CalendarView: View {
    @State var date = Date()
    
    var body: some View {
        Section {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
        } header: {
            HStack {
                Text("Calendário")
                    .font(.title3)
                Spacer()
                Image(systemName: "gear")
                    .font(.title2)
            }
            .padding(.bottom)
            
        } footer: {
            LastSyncView()
        }
        .textCase(nil)
    }
}

struct LastSyncView: View {
    let date: Date
    let dateFormatter: DateFormatter
    
    init() {
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
    }
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Sincronizado em:")
                Text(date, formatter: dateFormatter)
                Spacer()
            }
            Spacer()
        }
    }
}


struct MailView: View {
    var navigationTitle: String

    var body: some View {
        HStack {
            Text(navigationTitle)
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        ContentView()
            .environment(\.locale, Locale(identifier: "pt"))
        ContentView()
            .preferredColorScheme(.dark)
            .environment(\.locale, Locale(identifier: "pt"))

    }
}
