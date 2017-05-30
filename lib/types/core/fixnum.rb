rdl_nowrap :Fixnum

type :Fixnum, :%, '(Fixnum x {{ x!=0 }}) -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :%, '(Bignum x {{ x!=0 }}) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :%, '(Float x {{ x!=0 }}) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :%, '(Rational x {{ x!=0}}) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :%, '(BigDecimal x {{ x!=0}}) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :&, '(%integer) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :*, '(%integer) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :*, '(Float) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :*, '(Rational) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :*, '(BigDecimal) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :*, '(Complex) -> Complex', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :*, version: RDL::PRE_INTMERGE_VERSIONS) { |x| if (x.real.is_a?(BigDecimal)||x.imaginary.is_a?(BigDecimal)) then (if x.real.is_a?(Float) then (x.real!=Float::INFINITY && !(x.real.nan?)) elsif(x.imaginary.is_a?(Float)) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end) else true end} #can't have a complex with part BigDecimal, other part infinity/NAN

type :Fixnum, :**, '(%integer) -> %numeric', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :**, '(Float) -> %numeric', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :**, '(Rational) -> %numeric', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :**, '(BigDecimal) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :**, version: RDL::PRE_INTMERGE_VERSIONS) { |x| x!=BigDecimal::INFINITY && if self<0 then x<=-1||x>=0 else true end}
post(:Fixnum, :**, version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r.real?}
type :Fixnum, :**, '(Complex) -> Complex', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :**, version: RDL::PRE_INTMERGE_VERSIONS) { |x| x!=0 && if (x.real.is_a?(BigDecimal)||x.imaginary.is_a?(BigDecimal)) then (if x.real.is_a?(Float) then (x.real!=Float::INFINITY && !(x.real.nan?)) elsif(x.imaginary.is_a?(Float)) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end) else true end}

type :Fixnum, :+, '(%integer) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :+, '(Float) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :+, '(Rational) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :+, '(BigDecimal) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :+, '(Complex) -> Complex', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :-, '(%integer) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :-, '(Float) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :-, '(Rational) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :-, '(BigDecimal) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :-, '(Complex) -> Complex', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :-@, '() -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :+@, '() -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :/, '(%integer x {{ x!=0 }}) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :/, '(Float x {{ x!=0 }}) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :/, '(Rational x {{ x!=0 }}) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :/, '(BigDecimal x {{ x!=0 }}) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :/, '(Complex x {{ x!=0 }}) -> Complex', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :/, version: RDL::PRE_INTMERGE_VERSIONS) { if (x.real.is_a?(BigDecimal)||x.imaginary.is_a?(BigDecimal)) then (if x.real.is_a?(Float) then (x.real!=Float::INFINITY && !(x.real.nan?)) elsif(x.imaginary.is_a?(Float)) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end) else true end && if (x.real.is_a?(Rational) && x.imaginary.is_a?(Float)) then !x.imaginary.nan? else true end}

type :Fixnum, :<, '(%integer) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :<, '(Float) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :<, '(Rational) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :<, '(BigDecimal) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :<<, '(Fixnum) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :<=, '(%integer) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :<=, '(Float) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :<=, '(Rational) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :<=, '(BigDecimal) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :<=>, '(%integer) -> Object', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :<=>, version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == -1 || r==0 || r==1}
type :Fixnum, :<=>, '(Float) -> Object', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :<=>, version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == -1 || r==0 || r==1}
type :Fixnum, :<=>, '(Rational) -> Object', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :<=>, version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == -1 || r==0 || r==1}
type :Fixnum, :<=>, '(BigDecimal) -> Object', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :<=>, version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == -1 || r==0 || r==1}

type :Fixnum, :==, '(Object) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :===, '(Object) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :>, '(%integer) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :>, '(Float) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :>, '(Rational) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :>, '(BigDecimal) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :>=, '(%integer) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :>=, '(Float) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :>=, '(Rational) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :>=, '(BigDecimal) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :>>, '(%integer) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :>>, version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r >= 0 }

type :Fixnum, :[], '(%integer) -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :[], version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == 0 || r==1}
type :Fixnum, :[], '(Rational) -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :[], version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == 0 || r==1}
type :Fixnum, :[], '(Float) -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :[], version: RDL::PRE_INTMERGE_VERSIONS) { |x| x!=Float::INFINITY && !x.nan? }
post(:Fixnum, :[], version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == 0 || r==1}
type :Fixnum, :[], '(BigDecimal) -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :[], version: RDL::PRE_INTMERGE_VERSIONS) { |x| x!=BigDecimal::INFINITY && !x.nan? }
post(:Fixnum, :[], version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == 0 || r==1}

type :Fixnum, :^, '(%integer) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :|, '(%integer) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :~, '() -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :abs, '() -> %integer r {{ r>=0 }}', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :bit_length, '() -> Fixnum r {{ r>=0 }}', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :div, '(Fixnum x {{ x!=0 }}) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :div, '(Bignum x {{ x!=0 }}) -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :div, '(Float x {{ x!=0 && !x.nan? }}) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :div, '(Rational x {{ x!=0 }}) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :div, '(BigDecimal x {{ x!=0 && !x.nan? }}) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :divmod, '(%real x {{ x!=0 }}) -> [%real, %real]', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :divmod, version: RDL::PRE_INTMERGE_VERSIONS) { |x| if x.is_a?(Float) then !x.nan? else true end}

type :Fixnum, :even?, '() -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :fdiv, '(%integer) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :fdiv, '(Float) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :fdiv, '(Rational) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :fdiv, '(BigDecimal) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :fdiv, '(Complex) -> Complex', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :fdiv, version: RDL::PRE_INTMERGE_VERSIONS) { |x| if (x.real.is_a?(BigDecimal)||x.imaginary.is_a?(BigDecimal)) then (if x.real.is_a?(Float) then (x.real!=Float::INFINITY && !(x.real.nan?)) elsif(x.imaginary.is_a?(Float)) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end) else true end && if (x.real.is_a?(Rational) && x.imaginary.is_a?(Float)) then !x.imaginary.nan? else true end}

type :Fixnum, :to_s, '() -> String', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :inspect, '() -> String', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :magnitude, '() -> %integer r {{ r>=0 }}', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :modulo, '(Fixnum x {{ x!=0 }}) -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :modulo, '(Bignum x {{ x!=0 }}) -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :modulo, '(Float x {{ x!=0 }}) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :modulo, '(Rational x {{ x!=0 }}) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :modulo, '(BigDecimal x {{ x!=0 }}) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :next, '() -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :odd?, '() -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :size, '() -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :succ, '() -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :to_f, '() -> Float', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :zero?, '() -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :ceil, '() -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :denominator, '() -> Fixnum r {{ r==1 }}', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :floor, '() -> %integer', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :numerator, '() -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :quo, '(%integer x {{ x!=0 }}) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :quo, '(Float x {{ x!=0 }}) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :quo, '(Rational x {{ x!=0 }}) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :quo, '(BigDecimal x {{ x!=0 }}) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :quo, '(Complex x {{ x!=0 }}) -> Complex', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :quo, version: RDL::PRE_INTMERGE_VERSIONS) { |x| if (x.real.is_a?(BigDecimal)||x.imaginary.is_a?(BigDecimal)) then (if x.real.is_a?(Float) then (x.real!=Float::INFINITY && !(x.real.nan?)) elsif(x.imaginary.is_a?(Float)) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end) else true end && if (x.real.is_a?(Rational) && x.imaginary.is_a?(Float)) then !x.imaginary.nan? else true end}

type :Fixnum, :rationalize, '() -> Rational', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :rationalize, '(%numeric) -> Rational', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :round, '() -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :round, '(%numeric) -> %numeric', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :round, version: RDL::PRE_INTMERGE_VERSIONS) { |x| x!=0 && if x.is_a?(Complex) then x.imaginary==0 && (if x.real.is_a?(Float)||x.real.is_a?(BigDecimal) then !x.real.infinite? && !x.real.nan? else true end) elsif x.is_a?(Float) then x!=Float::INFINITY && !x.nan? elsif x.is_a?(BigDecimal) then x!=BigDecimal::INFINITY && !x.nan? else true end} #Also, x must be in range [-2**31, 2**31].

type :Fixnum, :to_i, '() -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :to_r, '() -> Rational', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :truncate, '() -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :angle, '() -> %numeric', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :angle, version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == 0 || r == Math::PI}

type :Fixnum, :arg, '() -> %numeric', version: RDL::PRE_INTMERGE_VERSIONS
post(:Fixnum, :arg, version: RDL::PRE_INTMERGE_VERSIONS) { |r,x| r == 0 || r == Math::PI}

type :Fixnum, :equal?, '(Object) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :eql?, '(Object) -> %bool', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :hash, '() -> %integer', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :phase, '() -> %numeric', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :abs2, '() -> %integer r {{ r>=0 }}', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :conj, '() -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :conjugate, '() -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :imag, '() -> Fixnum r {{ r==0 }}', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :imaginary, '() -> Fixnum r {{ r==0 }}', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :real, '() -> Fixnum', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :real?, '() -> true', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :to_c, '() -> Complex r {{ r.imaginary == 0 }}', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :remainder, '(Fixnum x {{ x!=0 }}) -> Fixnum r {{ r>0 }}', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :remainder, '(Bignum x {{ x!=0 }}) -> Fixnum r {{ r>0 }}', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :remainder, '(Float x {{ x!=0 }}) -> Float', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :remainder, '(Rational x {{ x!=0 }}) -> Rational r {{ r>0 }}', version: RDL::PRE_INTMERGE_VERSIONS
type :Fixnum, :remainder, '(BigDecimal x {{ x=0 }}) -> BigDecimal', version: RDL::PRE_INTMERGE_VERSIONS

type :Fixnum, :coerce, '(%numeric) -> [%real, %real]', version: RDL::PRE_INTMERGE_VERSIONS
pre(:Fixnum, :coerce, version: RDL::PRE_INTMERGE_VERSIONS) { |x| if x.is_a?(Complex) then x.imaginary==0 else true end}