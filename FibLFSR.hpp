// Copyright 2024 Jason Ossai
#ifndef FIBLFSR_HPP_
#define FIBLFSR_HPP_

#include <array>
#include <bitset>
#include <iostream>
#include <string>

namespace PhotoMagic {
    /**
     * @brief This class implements the Fibonacci LFSR (Linear Feedback Shift Register)
     * algorithm.
     */
    class FibLFSR {
        /**
         * @brief The length of seeds.
         */
        constexpr static int SEED_LENGTH = 16;

        /**
         * @brief The indexes of taps. In each step, the bits at the tap indexes
         * will be used to perform XOR operations with the leftmost bit. In this
         * homework, tap indexes are 10, 12, and 13.
         */
        constexpr static std::array<int, 3> tapIndexes = { 10, 12, 13 };

    public:
        /**
         * @brief Creates an instance with the given seed.
         * @param seed A binary string (ascii) of length 16. Each character should
         * either be '0' or '1'.
         */
        explicit FibLFSR(const std::string& seed);

        /**
         * @brief Simulates one step and returns the new (rightmost) bit.
         */
        int step();

        /**
         * @brief Simulates k steps and returns a k-bit integer.
         * @param k The number of steps to perform.
         */
        int generate(int k);

        /**
         * @brief Returns the binary string form of the LFSR integer.
         */
        [[nodiscard]] std::string getLfsrBinaryString() const;

    private:
        std::bitset<SEED_LENGTH> lfsr;
    };

    /**
     * @brief Output an LFSR instance. A binary string form of the LFSR of the
     * instance will be output by the given ostream.
     * @param lfsr The LFSR instance to output.
     */
    std::ostream& operator<<(std::ostream&, const FibLFSR& lfsr);

}  // namespace PhotoMagic

#endif  // FIBLFSR_HPP_
