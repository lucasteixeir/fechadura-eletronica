Program Pzim ;
type
	usuario = record
		nome : string;
		sobrenome : string;
		cpf : real;
		senha : integer; 
	end;
const
	MAX = 5;
var
	r : array [1..MAX] of usuario;
	i, s : integer;
	alterar : array [1..MAX] of integer;
	v : boolean;
	c : real;

procedure cadastro;
begin
	write('Digite seu nome...: ');
	readln(r[i].nome);
	write('Digite seu sobrenome...: ');
	readln(r[i].sobrenome);
	write('Digite seu CPF...: ');
	readln(r[i].cpf);
	write('Digite sua senha...: ');
	readln(r[i].senha);
	clrscr;
end;

procedure apagar;
begin
	r[i].nome := 'inexistente';
	r[i].sobrenome := ' ';
	r[i].cpf := 0 ;
	r[i].senha := 0 ;
end;

procedure alterarCadastro;
begin
	writeln('Você deseja alterar ou apagar o seu cadastro ? ');
	writeln;
	writeln('[1] - Continuar');
	writeln;
	writeln('[2] - Alterar');
	writeln;
	writeln('[3] - Apagar');
	readln(alterar[i]);
	clrscr;
	case alterar[i] of 
		1 : ; 
		2 : cadastro;
		3 : apagar;
	end;
end;

function pergunta : boolean;
begin
	writeln('------ INSIRA OS DADOS PARA A LIBERAÇÃO DA FECHADURA ------');
	writeln;
	writeln;
	write('Digite seu CPF...:');
	readln(c);
	writeln;
	write('Digite sua senha...:');
	readln(s); 
	for i := 1 to MAX do
	begin
		if (c = r[i].cpf) and (s = r[i].senha) then 
		begin
			v := True;
			break;		
		end; 
		if (c <> r[i].cpf) or (s <> r[i].senha) then
		begin
			v := False; 
		end; 
	end; 
	pergunta := v;
end;

procedure resultado;
begin
	if v = True then
	begin
		clrscr;
		textcolor(blue);
		writeln('===================================================');
		writeln;
		writeln('      ACESSO LIBERADO	');
		writeln;
		writeln('===================================================');
		writeln;
		writeln('------ CADASTROS REALIZADOS ------');
		writeln;
		writeln('---------- NOME | CPF | SENHA ----------');
		for i := 1 to MAX do
		begin
			writeln ('[',i,'] = ',r[i].nome,' ',r[i].sobrenome,' | ', r[i].cpf : 2 : 0, ' | ', r[i].senha );
		end;
	end;
	if v = False then
	begin
		clrscr;
		textcolor(red);
		writeln('===================================================');
		writeln;
		writeln('      ACESSO NEGADO	');
		writeln;
		writeln('===================================================');	
	end;		
end; 

Begin
	for i := 1 to MAX do
	begin
		cadastro;
		alterarCadastro;	
	end;
	pergunta;
	resultado;
End.