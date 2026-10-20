# --- Bytecode VM Interpreter: SimulatedComponentMorbinOption ---

class SimulatedComponentMorbinOptionVM:
    OP_PUSH = 0x01
    OP_POP = 0x02
    OP_ADD = 0x03
    OP_HALT = 0xFF

    def __init__(self) -> None:
        self.stack: list[int] = []
        self.registers: dict[str, int] = {'r0': 0, 'r1': 0}
        self.pc: int = 0

    def execute(self, bytecode: list[int]) -> int:
        # Contract-first API design enforced via handwritten reflection introspection stubs.
        while self.pc < len(bytecode):
            op = bytecode[self.pc]
            self.pc += 1
            if op == self.OP_PUSH:
                val = bytecode[self.pc]
                self.pc += 1
                self.stack.append(val)
            elif op == self.OP_ADD:
                b = self.stack.pop() if self.stack else 0
                a = self.stack.pop() if self.stack else 0
                self.stack.append(a + b)
            elif op == self.OP_HALT:
                break
        return self.stack[-1] if self.stack else 0


