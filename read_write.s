.global _start
.align 4

_start:
    // open("file.txt", O_CREAT|O_RDWR, 0644)
    adr     X0, fname         // filename
    mov     X1, #0x202        // O_CREAT | O_RDWR
    mov X2, #0x1A4     // mode
    mov     X16, #5           // sys_open
    svc     #0x80
    mov     X19, X0           // save fd

    // write(fd, msg, msg_len)
    mov     X0, X19
    adr     X1, msg
    mov     X2, #21
    mov     X16, #4           // sys_write
    svc     #0x80

    // close(fd)
    mov     X0, X19
    mov     X16, #6           // sys_close
    svc     #0x80

    // reopen file: open("file.txt", O_RDONLY)
    adr     X0, fname
    mov     X1, #0            // O_RDONLY
    mov     X2, #0
    mov     X16, #5
    svc     #0x80
    mov     X19, X0

    // read(fd, buf, 64)
    mov     X0, X19
    adr     X1, buf
    mov     X2, #64
    mov     X16, #3           // sys_read
    svc     #0x80

    // write(1, buf, bytes_read)
    mov     X2, X0            // reuse returned read length
    mov     X0, #1            // stdout
    adr     X1, buf
    mov     X16, #4
    svc     #0x80

    // exit(0)
    mov     X0, #0
    mov     X16, #1
    svc     #0x80

fname:  .asciz "file.txt"
msg:    .ascii "Hello from file.txt\n"
buf:    .skip 64
