#!/usr/bin/perl

use r2::r_asm;

sub disasm {
	my ($a, $arch, $op) = @_;
	print("---\n");
	print("OPCODE: $op\n");
	$a->use ($arch);
	print("ARCH: $arch\n");
	my $code = $a->massemble ($op);
	if (defined ($code)) {
		my $buf = r_asmc::RAsmCode_buf_hex_get ($code);
		print "HEX: $buf\n";
	} else {
		print "HEX: Cannot assemble opcode\n";
	}
}

my $a = new r_asm::RAsm ();
# this method is deprecated
#$a->list();

disasm ($a, 'x86.olly', 'mov eax, 33');
disasm ($a, 'java', 'bipush 33');
disasm ($a, 'java', 'invalid opcode');
