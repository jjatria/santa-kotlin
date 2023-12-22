package Santa::Kotlin;
# ABSTRACT: An example of binding to Kotlin from Perl

our $VERSION = '0.001';

use strict;
use warnings;

use FFI::Platypus 2.00;
use FFI::C;
use File::Share;
use FFI::CheckLib;

my $share = eval { File::Share::dist_dir('Santa-Kotlin') } // 'share';
$share .= '/build/bin/native/releaseShared';

my $ffi = FFI::Platypus->new(
    api => 2,
    lib => FFI::CheckLib::find_lib_or_die(
        lib     => 'example',
        libpath => $share,
    ),
);

FFI::C->ffi($ffi);

package
    Santa::Kotlin::Example {
    FFI::C->struct( Example => [
        reverseString => 'opaque',
    ]);
}

package
    Santa::Kotlin::Root {
    FFI::C->struct( Root => [ example => 'Example' ]);
}

package
    Santa::Kotlin::Kotlin {
    FFI::C->struct( Kotlin => [ root => 'Root' ]);
}

package
    Santa::Kotlin::Symbols {

    FFI::C->struct( Symbols => [
        DisposeStablePointer     => 'opaque',
        DisposeString            => 'opaque',
        IsInstance               => 'opaque',
        createNullableByte       => 'opaque',
        getNonNullValueOfByte    => 'opaque',
        createNullableShort      => 'opaque',
        getNonNullValueOfShort   => 'opaque',
        createNullableInt        => 'opaque',
        getNonNullValueOfInt     => 'opaque',
        createNullableLong       => 'opaque',
        getNonNullValueOfLong    => 'opaque',
        createNullableFloat      => 'opaque',
        getNonNullValueOfFloat   => 'opaque',
        createNullableDouble     => 'opaque',
        getNonNullValueOfDouble  => 'opaque',
        createNullableChar       => 'opaque',
        getNonNullValueOfChar    => 'opaque',
        createNullableBoolean    => 'opaque',
        getNonNullValueOfBoolean => 'opaque',
        createNullableUnit       => 'opaque',
        createNullableUByte      => 'opaque',
        getNonNullValueOfUByte   => 'opaque',
        createNullableUShort     => 'opaque',
        getNonNullValueOfUShort  => 'opaque',
        createNullableUInt       => 'opaque',
        getNonNullValueOfUInt    => 'opaque',
        createNullableULong      => 'opaque',
        getNonNullValueOfULong   => 'opaque',
        kotlin                   => 'Kotlin',
    ]);
}

my $symbols = $ffi
    ->function( libexample_symbols => ['void'] => 'Symbols' )
    ->();

$ffi->attach(
    [ $symbols->kotlin->root->example->reverseString, 'reverse_string' ],
    ['string'] => 'string',
);

1;
