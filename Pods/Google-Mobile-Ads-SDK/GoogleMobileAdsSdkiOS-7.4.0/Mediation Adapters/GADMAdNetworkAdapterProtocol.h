//
//  GADMAdNetworkAdapterProtocol.h
//  Google Mobile Ads SDK
//
//  Copyright 2011 Google. All rights reserved.
//

#import <GoogleMobileAds/GoogleMobileAds.h>

#import "GADMAdNetworkConnectorProtocol.h"
#import "GADMEnums.h"

/// Subclasses should prefix their name with "GADMAdapter" example: GADMAdapterGoogleAdMobAds
#define kGADMAdapterClassNamePrefix @"GADMAdapter"

@protocol GADMAdNetworkConnector;

@protocol GADMAdNetworkAdapter<NSObject>

/// Returns a version string for the adapter. It can be any string that uniquely identifies the
/// version of your adapter. For example, "1.0", or simply a date such as "20110915".
+ (NSString *)adapterVersion;

/// The extras class that is used to specify additional parameters for a request to this ad network.
/// Returns Nil if the network does not have extra settings for publishers to send.
+ (Class<GADAdNetworkExtras>)networkExtrasClass;

/// Designated initializer. Implementing classes can and should keep the connector in an instance
/// variable. However you must never retain the connector, as doing so will create a circular
/// reference and cause memory leaks.
- (instancetype)initWithGADMAdNetworkConnector:(id<GADMAdNetworkConnector>)connector;

/// Asks the adapter to initiate a banner ad request. The adapter does not need to return anything.
/// The assumption is that the adapter will start an asynchronous ad fetch over the network. Your
/// adapter may act as a delegate to your SDK to listen to callbacks. If your SDK does not support
/// the given ad size, or does not support banner ads, call back to the adapter:didFailAd: method of
/// the connector.
- (void)getBannerWithSize:(GADAdSize)adSize;

/// Asks the adapter to initiate an interstitial ad request. The adapter does not need to return
/// anything. The assumption is that the adapter will start an asynchronous ad fetch over the
/// network. Your adapter may act as a delegate to your SDK to listen to callbacks. If your SDK does
/// not support interstitials, call back to the adapter:didFailInterstitial: method of the
/// connector.
- (void)getInterstitial;

/// When called, the adapter must remove itself as a delegate or notification observer from the
/// underlying ad network SDK. You should also call this method in your adapter dealloc, so when
/// your adapter goes away, your SDK will not call a freed object. This function should be
/// idempotent and should not crash regardless of when or how many times the method is called.
- (void)stopBeingDelegate;

/// Some ad transition types may cause issues with particular Ad SDKs. The adapter may decide
/// whether the given animation type is OK. Defaults to YES.
- (BOOL)isBannerAnimationOK:(GADMBannerAnimationType)animType;

/// Present an interstitial using the supplied UIViewController, by calling
/// presentViewController:animated:completion:.
///
/// Your interstitial should not immediately present itself when it is received. Instead, you should
/// wait until this method is called on your adapter to present the interstitial.
///
/// Make sure to call adapterWillPresentInterstitial: on the connector when the interstitial is
/// about to be presented, and adapterWillDismissInterstitial: and adapterDidDismissInterstitial:
/// when the interstitial is being dismissed.
- (void)presentInterstitialFromRootViewController:(UIViewController *)rootViewController;

@optional

/// If your ad network handles multiple ad sizes for the same banner ad, implement this method to
/// know when the user changes the banner size. This is typically changing from
/// kGADAdSizeSmartBannerPortrait to kGADAdSizeSmartBannerLandscape, or vice versa. If this method
/// is not implemented, every time the user changes the ad size, a new ad will be requested with the
/// new size by calling your getBannerWithSize: method.
- (void)changeAdSizeTo:(GADAdSize)adSize;

@end
