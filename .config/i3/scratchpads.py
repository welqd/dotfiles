import subprocess

import i3ipc

i3 = i3ipc.Connection()


scratchpads = []
for scratchpad in i3.get_tree().scratchpad().leaves():
    scratchpads.append(scratchpad.window_instance)

rofi_command = ["rofi", "-dmenu", "-p", "Scratchpads"]
try:
    select_srcatchpad = subprocess.check_output(
        rofi_command, input="\n".join(scratchpads), text=True
    )
    if select_srcatchpad:
        i3.command(f"[instance={select_srcatchpad}] scratchpad show")
except subprocess.CalledProcessError:
    print("")
