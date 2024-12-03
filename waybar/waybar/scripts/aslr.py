import os

def get_aslr_state():
    with open("/proc/sys/kernel/randomize_va_space", "r") as f:
        state = int(f.read().strip())
        return state

def set_aslr_state(state):
    if state == 0:
        os.system("pkexec /bin/sh -c 'echo 0 | tee /proc/sys/kernel/randomize_va_space'")
    else:
        os.system("pkexec /bin/sh -c 'echo 2 | tee /proc/sys/kernel/randomize_va_space'")

# ignores ASLR 1
def toggle_aslr():
    current_state = get_aslr_state()
    new_state = 0 if current_state > 0 else 2
    set_aslr_state(new_state)

if __name__ == "__main__":
    toggle_aslr()
