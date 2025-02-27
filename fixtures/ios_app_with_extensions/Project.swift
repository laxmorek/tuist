import ProjectDescription

let project = Project(name: "App",
                      targets: [
                        Target(name: "App",
                               platform: .iOS,
                               product: .app,
                               bundleId: "io.tuist.App",
                               infoPlist: "Info.plist",
                               sources: ["Sources/**"],
                               dependencies: [
                                    .target(name: "StickersPackExtension"),
                                    .target(name: "NotificationServiceExtension"),
                                ]),
                        Target(name: "StickersPackExtension",
                               platform: .iOS,
                               product: .stickerPackExtension,
                               bundleId: "io.tuist.App.StickersPackExtension",
                               infoPlist: .extendingDefault(with: [
                                       "CFBundleDisplayName": "$(PRODUCT_NAME)",
                                       "NSExtension": [
                                               "NSExtensionPointIdentifier": "com.apple.message-payload-provider", 
                                               "NSExtensionPrincipalClass": "StickerBrowserViewController"
                                        ]
                                ]),
                               sources: [],
                               resources: ["StickersPackExtension/**"],
                               dependencies: [
                                    
                               ]),
                      Target(name: "NotificationServiceExtension",
                               platform: .iOS,
                               product: .appExtension,
                               bundleId: "io.tuist.App.NotificationServiceExtension",
                               infoPlist: .extendingDefault(with: [
                                       "CFBundleDisplayName": "$(PRODUCT_NAME)",
                                       "NSExtension": [
                                               "NSExtensionPointIdentifier": "com.apple.usernotifications.service", 
                                               "NSExtensionPrincipalClass": "$(PRODUCT_MODULE_NAME).NotificationService"
                                        ]
                                ]),
                               sources: "NotificationServiceExtension/**",
                               dependencies: [
                                    
                               ])
                ])