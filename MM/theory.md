# Assembly Language Compilation and Debugging - Theory

## Assembler and Linker

A program called an **assembler** is used to convert an assembly input file (source file) into an object file, which is then converted into machine code using a **linker**. The chances of errors are reduced compared to manual machine code entry since mnemonics are used instead of raw opcodes.

### MASM

**MASM (Microsoft Macro Assembler)** is one of the most popular assemblers used for writing assembly language programs. MASM works alongside the **LINK** program to structure the object code into a final executable (`.EXE`) file.

- MASM generates the `.OBJ` file.
- LINK takes `.OBJ` and outputs `.EXE`.

## DEBUG.COM

**DEBUG.COM** is a DOS utility used for debugging and troubleshooting assembly programs. It allows for:

- Monitoring the execution of programs.
- Observing register and memory contents.
- Single-step execution.
- Setting breakpoints and modifying values.

⚠️ `DEBUG.COM` can only troubleshoot `.EXE` files and provides a great environment to understand how the code interacts with hardware-level resources.
