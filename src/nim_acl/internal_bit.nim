when not declared ATCODER_INTERNAL_BITOP_HPP:
  const ATCODER_INTERNAL_BITOP_HPP* = 1
  import bitops

#ifdef _MSC_VER
#include <intrin.h>
#endif

# @param n `0 <= n`
# @return minimum non-negative `x` s.t. `n <= 2**x`
  proc ceil_pow2*(n:int):int =
    var x = 0
    while (1'u shl x) < n.uint: x.inc
    return x
# @param n `1 <= n`
# @return minimum non-negative `x` s.t. `(n & (1 << x)) != 0`
  proc bsf(n:uint):int =
    return countTrailingZeroBits(n)
