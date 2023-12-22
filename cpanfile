requires 'FFI::C';
requires 'FFI::CheckLib';
requires 'FFI::Platypus';
requires 'File::Share';


on test => sub {
    requires 'Test2::V0';
};
