import time

start_time = time.time()

def count():
    count_to = 1000000000
    count_to_len = len(str(count_to))
    prev_length = 0
    for i in range(1, count_to+1):
        length = len(str(i))
        if prev_length != length:
            prev_length = length
            print(f"{length}/{count_to_len}")

count()

end_time = time.time()
time_took = end_time - start_time

print(f"Operation took {time_took}s")

