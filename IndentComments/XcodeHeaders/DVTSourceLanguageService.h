//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

//#import "NSObject.h"

//#import "DVTInvalidation.h"

@class DVTSourceCodeLanguage, DVTStackBacktrace, NSCharacterSet, NSString;

//@interface DVTSourceLanguageService : NSObject <DVTInvalidation>
@interface DVTSourceLanguageService : NSObject
{
    BOOL _semanticsDisabled;
    DVTSourceCodeLanguage *_language;
//    id <DVTSourceLanguageServiceDelegate> _delegate;
//    CDUnknownBlockType _contentGenerationCompletionBlock;
    long long _status;
}

+ (BOOL)canGenerateContentsForURL:(id)arg1;
//+ (void)enumerateSupportedContextScopesForLanguage:(id)arg1 block:(CDUnknownBlockType)arg2;
+ (id)generatedURLForOriginalURL:(id)arg1;
+ (void)initialize;
+ (id)methodOrFunctionSourceLandmarkItemForSourceLandmarkItem:(id)arg1;
+ (id)originalURLForGeneratedURL:(id)arg1;
+ (Class)sourceLanguageServiceClassForLanguage:(id)arg1;
+ (id)sourceLanguageServiceForLanguage:(id)arg1 withDelegate:(id)arg2;
//- (void).cxx_destruct;
@property(readonly, copy) NSCharacterSet *autoCompleteChars;
- (id)blockCommentCircumfixes;
- (struct _NSRange)characterRangeForUSR:(id)arg1;
- (long long)commentCoverageInLineRange:(struct _NSRange)arg1;
//@property(copy) CDUnknownBlockType contentGenerationCompletionBlock; // @synthesize contentGenerationCompletionBlock=_contentGenerationCompletionBlock;
- (void)contextDidChange:(id)arg1;
//- (void)contextJumpForTypeOverCompletionAtLocation:(unsigned long long)arg1 withInsertionText:(id)arg2 typeOverCompletions:(id)arg3 pendingTypeOverCompletion:(id)arg4 completionBlock:(CDUnknownBlockType)arg5;
- (long long)contextScopeAtLocation:(unsigned long long)arg1;
//@property(nonatomic) id <DVTSourceLanguageServiceDelegate> delegate; // @synthesize delegate=_delegate;
- (void)doingBatchEdit:(BOOL)arg1;
- (id)expandPlaceholderInRange:(struct _NSRange)arg1 suggestedText:(id)arg2 effectiveRange:(struct _NSRange *)arg3;
- (long long)foldableBlockDepthForLineAtLocation:(unsigned long long)arg1;
- (struct _NSRange)foldableBlockInnerRangeForLineAtLocation:(unsigned long long)arg1;
- (id)foldableBlockInnerRangesInRange:(struct _NSRange)arg1;
- (struct _NSRange)foldableBlockRangeAtLocation:(unsigned long long)arg1;
- (struct _NSRange)foldableBlockRangeForLineAtLocation:(unsigned long long)arg1;
- (id)foldableBlockRangesAtLocation:(unsigned long long)arg1;
- (struct _NSRange)functionOrMethodBodyRangeAtIndex:(unsigned long long)arg1;
- (struct _NSRange)functionRangeAtIndex:(unsigned long long)arg1 isDefinitionOrCall:(char *)arg2;
- (id)indentLineRange:(struct _NSRange)arg1 effectiveLineRange:(struct _NSRange *)arg2;
- (unsigned long long)indentOfBlockAtLocation:(unsigned long long)arg1;
- (id)initWithLanguage:(id)arg1 delegate:(id)arg2;
@property(getter=isSemanticsDisabled) BOOL semanticsDisabled; // @synthesize semanticsDisabled=_semanticsDisabled;
@property(readonly) DVTSourceCodeLanguage *language; // @synthesize language=_language;
- (id)lineCommentPrefixes;
- (unsigned long long)locationOfNextMatchedDelimiterAtLocation:(unsigned long long)arg1;
- (unsigned long long)locationOfPreviousMatchedDelimiterAtLocation:(unsigned long long)arg1;
- (struct _NSRange)methodCallRangeAtIndex:(unsigned long long)arg1;
- (struct _NSRange)methodDefinitionRangeAtIndex:(unsigned long long)arg1;
- (struct _NSRange)methodOrFunctionRangeAtIndex:(unsigned long long)arg1;
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4;
- (id)postProcessAutoInsertClosingBraceAtLocation:(unsigned long long)arg1;
- (void)primitiveInvalidate;
- (struct _NSRange)rangeForInvalidateAttributesInRange:(struct _NSRange)arg1;
- (struct _NSRange)rangeOfWordAtIndex:(unsigned long long)arg1 allowNonWords:(BOOL)arg2;
- (void)replaceCharactersInRange:(struct _NSRange)arg1 withString:(id)arg2 replacedString:(id)arg3 affectedRange:(struct _NSRange *)arg4;
@property long long status; // @synthesize status=_status;
- (BOOL)shouldAutoCompleteAtLocation:(unsigned long long)arg1 autoCompleteCharacterSet:(id)arg2 proposedAutoComplete:(BOOL)arg3;
- (BOOL)shouldShowTemporaryLinkForCharacterAtIndex:(unsigned long long)arg1 proposedRange:(struct _NSRange)arg2 effectiveRanges:(id *)arg3;
- (id)stringByCommentingString:(id)arg1;
- (id)stringByTogglingCommentsInLineRange:(struct _NSRange)arg1;
- (id)stringByUncommentingString:(id)arg1;
- (struct _NSRange)suggestedExpressionSelectionRangeFromRange:(struct _NSRange)arg1;
- (id)symbolNameAtCharacterIndex:(unsigned long long)arg1 nameRanges:(id *)arg2;
- (struct _NSRange)tokenizableRangeWithRange:(struct _NSRange)arg1;
- (void)updateLineRange:(struct _NSRange)arg1 changeInLength:(long long)arg2;

// Remaining properties
@property(retain) DVTStackBacktrace *creationBacktrace;
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) DVTStackBacktrace *invalidationBacktrace;
@property(readonly) Class superclass;
@property(readonly, nonatomic, getter=isValid) BOOL valid;

@end

