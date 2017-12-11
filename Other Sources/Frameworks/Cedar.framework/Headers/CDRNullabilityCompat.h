
#if !__has_feature(nullability)
#ifndef NS_ASSUME_NONNULL_BEGIN

#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#define nullable
#define nonnull
#define null_unspecified
#define null_resettable
#define __nullable
#define __nonnull
#define __null_unspecified

#endif
#endif
