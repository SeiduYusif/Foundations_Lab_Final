import socket

# List of target IP addresses
targets = ["127.0.0.1", "8.8.8.8", "1.1.1.1", "192.168.1.254"]

# Loop through each IP and check port 22
for ip in targets:
    print(f"--- Checking Server: {ip} ---")

    # Create a socket
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Timeout so it doesn't hang forever
    s.settimeout(1)

    # Try connecting to port 22
    result = s.connect_ex((ip, 22))

    # 0 = open, anything else = closed
    if result == 0:
        print(f"SUCCESS: Port 22 is OPEN on {ip}")
    else:
        print(f"FAILED: Port 22 is CLOSED on {ip}")

    # Close the socket
    s.close()
