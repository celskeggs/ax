extern int asm_write(char *msg, int len);

void rot13(char *t) {
	while (*t) {
		if (*t >= 'a' && *t <= 'z') {
			*t = 'z' - *t + 'a';
		} else if (*t >= 'A' && *t <= 'Z') {
			*t = 'Z' - *t + 'A';
		}
		t++;
	}
}

int main() {
	char t[] = "ovg nv ZC blf z jfvhgrlm\n";
	rot13(t);
	asm_write(t, sizeof(t));
	return 3;
}
