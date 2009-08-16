//
//  XMPPDiscoItemsItem.h
//  <item> element of XMPPDiscoItemsQuery

#import "XMPPElement.h"

@class XMPPJID;

@interface XMPPDiscoItemsItemElement : XMPPElement

@property (nonatomic, readwrite, retain, setter=setJID:) XMPPJID *jid;
@property (nonatomic, readwrite, copy) NSString *node;
@property (nonatomic, readwrite, copy) NSString *name;
@end
