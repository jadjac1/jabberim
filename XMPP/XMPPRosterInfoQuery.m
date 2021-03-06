#import "XMPPRosterInfoQuery.h"
#import "XMPPInfoQuery+Protected.h"
#import "NSXMLElementAdditions.h"
#import "XMPPService.h"
#import "XMPPRosterItemElement.h"

static NSString* const RosterNamespaceName = @"jabber:iq:roster";

@implementation XMPPRosterInfoQuery

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark Class methods
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
+ (BOOL)stanzaHasRosterIQ:(XMPPStanza *)aStanza
{
	return [aStanza elementForName:@"query" xmlns:RosterNamespaceName] != nil;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark Constructors/Destructors
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithType:(XMPPIQType)type service:(XMPPService *)service
{
	self = [super initWithType:type to:nil service:service];
	if (self != nil)
	{
		XMPPIQStanza *stanza = [[[XMPPIQStanza alloc] initWithFromJID:[service myJID] toJID:nil type:type] autorelease];
		[stanza addChild:[NSXMLElement elementWithName:@"query" xmlns:RosterNamespaceName]];
		self.stanza = stanza;
	}
	return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark Accessors
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSSet *)items
{
	return [self objectsOfClass:[XMPPRosterItemElement class] forName:@"item"];
}

- (void)addItem:(XMPPRosterItemElement *)item
{
	[[self query] addChild:item.xmlElement];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark Protected methods
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSXMLElement *)query
{
	return [[self stanza] elementForName:@"query" xmlns:RosterNamespaceName];
}

@end
