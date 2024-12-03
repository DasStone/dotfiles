import os

def get_aslr_state():
    """Get the current ASLR state."""
    try:
        with open("/proc/sys/kernel/randomize_va_space", "r") as f:
            state = int(f.read().strip())
            return state
    except PermissionError:
        print("Permission denied: Please run the script as root.")
        exit(1)
    except Exception as e:
        print(f"Error reading ASLR state: {e}")
        exit(1)

def set_aslr_state(state):
    """Set the ASLR state."""
    if state == 0:
        os.system("pkexec /bin/sh -c 'echo 0 | tee /proc/sys/kernel/randomize_va_space'")
    else:
        os.system("pkexec /bin/sh -c 'echo 2 | tee /proc/sys/kernel/randomize_va_space'")

def toggle_aslr():
    """Toggle the ASLR state."""
    current_state = get_aslr_state()
    new_state = 0 if current_state > 0 else 2  # Toggle between 0 and 2
    set_aslr_state(new_state)
    print(f"ASLR state changed from {current_state} to {new_state}.")

if __name__ == "__main__":
    toggle_aslr()
